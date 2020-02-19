ActiveAdmin.register User do
  # set the params whitelisting
  permit_params :community, :name, :email, :contact_number, :role

  # add the Send SMS action item to the show view of the current resource, which
  # will only appear if the contact_number field is not nil (ideally this would
  # have some sort of phone format validation in a production application,
  # for now, it only checks that the field is populated with a minimum of 10
  # characters.
  action_item :send_sms,
    only: :show,
    if: proc{ resource.contact_number.to_s.length >= 10 } do
    link_to 'Send SMS', notifications_send_sms_path(resource: resource.to_json), :method => :post
  end

  # build the form
  form do |f|
    f.inputs do
      f.input :community
      f.input :name
      f.input :email
      f.input :contact_number # include the new field in the form
      f.input :role, collection: User::ROLES, include_blank: false
    end
    f.actions
  end
end
