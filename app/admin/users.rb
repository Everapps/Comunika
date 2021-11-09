ActiveAdmin.register User do
  permit_params :name, :email, :phone_number, :community_id, :role

  scope :all
  scope :managers
  scope :owners

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
end
