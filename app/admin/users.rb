ActiveAdmin.register User do
  form do |f|
    f.inputs do
      f.input :community
      f.input :name
      f.input :email
      f.input :contact_number
      f.input :role, collection: User::ROLES, include_blank: false
    end
    f.actions
  end

  # Create action button on User#show page
  action_item :send_sms, only: :show, priority: 0 do
    link_to "Send SMS", "/admin/users/#{params[:id]}/create_sms"
  end

  # Return current user to page
  member_action :create_sms, :method=>:get do
    @user = User.find(params[:id])
  end

  controller do
    def createsms

    end
  end
end
