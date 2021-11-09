ActiveAdmin.register User do
  permit_params :name, :email, :phone_number, :community_id, :role

  scope :all
  scope :managers
  scope :owners

  controller do
    skip_before_action :verify_authenticity_token, :only => [:send_message]
  end

  form do |f|
    f.inputs do
      f.input :community
      f.input :name
      f.input :email
      f.input :phone_number
      f.input :role, collection: User.roles.keys.to_a, include_blank: false
    end
    f.actions
  end

  member_action :send_message, method: :post do
    user = User.find(params[:id])

    Message.create(user: user,
                   message: params[:message],
                   admin_user: current_admin_user)

    redirect_to resource_path(user)
  end

  sidebar 'Send Message', only: :show do
    if resource.phone_number.present?
      form action: send_message_admin_user_path, method: :post do |f|
        f.input :message, type: :text, name: :message
        hr
        f.input :submit, type: :submit
      end
    else
      span 'Specify a phone number to send a message'
    end
  end
end
