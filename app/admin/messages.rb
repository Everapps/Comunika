ActiveAdmin.register Message do
  member_action :create, :method => :post do
  end

  controller do
    def create
      @message = Message.new(message_params)
      @user = User.find(@message.user_id)

      respond_to do |format|
        if @message.save
          begin
            init_twilio
            sms = @client.messages.create(
                from: ENV['TWILIO_NUMBER'],
                to: @user.contact_number,
                body: @message.message
            )
          rescue Twilio::REST::RestError => e
            format.html { redirect_to "/admin/users/#{@user.id}/create_sms", notice: "Error: unable to send message to " + @user.name + ", invalid contact number" }
          rescue StandardError => e
            format.html { redirect_to "/admin/users/#{@user.id}/create_sms", notice: "Error: unable to send message to " + @user.name }
          else
            format.html { redirect_to admin_users_path, notice: "Message was successfully sent to #{@user.name}." }
          end
        else
          format.html { redirect_to "/admin/users/#{@user.id}/create_sms", notice: "Error: unable to send message to " + @user.name }
        end
      end
    end

    def message_params
      params.require(:message).permit(:message, :user_id)
    end

    def init_twilio
      account_sid = ENV['TWILIO_SID']
      auth_token = ENV['TWILIO_TOKEN']
      @client = Twilio::REST::Client.new account_sid, auth_token
    end
  end
end
