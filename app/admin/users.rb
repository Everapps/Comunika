ActiveAdmin.register User do
  permit_params :community_id, :name, :email, :phone, :role

  form do |f|
    f.inputs do
      f.input :community
      f.input :name
      f.input :email
      f.input :phone
      f.input :role, collection: User::ROLES, include_blank: false
    end
    f.actions
  end

  action_item :new_notification, only: :show, if: proc { resource.phone.to_s.present? } do
    link_to 'Send SMS', new_admin_user_notification_path(resource)
  end
end
