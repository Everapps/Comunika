ActiveAdmin.register User do
  permit_params :contact_number, :name, :email, :role

  form do |f|
    f.inputs do
      f.input :community
      f.input :name
      f.input :email
      f.input :role, collection: User::ROLES, include_blank: false
      f.input :contact_number
    end
    f.actions
  end
end
