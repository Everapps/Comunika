ActiveAdmin.register Message do
  member_action :create, :method => :post do
  end

  controller do
    def create
      @message = Message.new(message_params)
      @user = User.find(@message.user_id)

      respond_to do |format|
        if @message.save
          SendTextMessageJob.perform_later(@user.contact_number, "To #{@user.role.capitalize}: " + @message.message)
          format.html { redirect_to admin_users_path, notice: "Message was successfully sent to #{@user.name}." }
        else
          format.html { redirect_to "/admin/users/#{@user.id}/create_sms", notice: "Error: unable to send message to " + @user.name }
        end
      end
    end

    def message_params
      params.require(:message).permit(:message, :user_id)
    end
  end
end
