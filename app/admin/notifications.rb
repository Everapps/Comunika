ActiveAdmin.register Notification do
  belongs_to :user

  permit_params :user_id, :message

  form do |f|
    f.inputs do
      f.input :message
      f.input :user, collection: User.all, include_blank: false
    end
    f.actions
  end
end
