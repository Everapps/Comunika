ActiveAdmin.register Message do
  permit_params :body, :user_id

  form do |f|
    f.inputs do
      f.input :body
      f.input :user, collection: User.all
    end
    f.actions
  end

  controller do
    def create
      if new_message.save
        new_message.notify_user
        flash[:notice] = "Success"
      else
        flash[:alert] = "Fail"
      end
      redirect_to admin_users_path
    end

    def new_message
      @new_message ||= Message.new(message_params)
    end

    def user
      @user ||= User.find(message_params[:user_id])
    end

    def message_params
      params.require(:message).permit(:body, :user_id)
    end
  end
end
