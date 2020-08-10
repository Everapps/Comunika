ActiveAdmin.register Message do
  member_action :create, :method => :post do
  end

  controller do
    def create
      redirect_to admin_users_path
    end

    def message_params
      params.require(:message).permit(:message, :user_id)
    end
  end
end
