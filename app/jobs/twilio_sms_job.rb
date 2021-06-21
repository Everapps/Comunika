class TwilioSmsJob < ApplicationJob
  def perform(notification_id)
    resource = Notification.find(notification_id)
    phone = resource.user.phone

    message = resource.message
    message = owner_message(message) if resource.user.owner?
    message = tenant_message(message) if resource.user.tenant?

    ::TwilioSms.new(phone, message).call
  end

  protected

  def owner_message(message)
    role_message('To Owner', message)
  end

  def tenant_message(message)
    role_message('To Tenant', message)
  end

  def role_message(greeting, message)
    "#{greeting}: #{message}"
  end
end
