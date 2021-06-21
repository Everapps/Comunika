class TwilioSmsJob < ApplicationJob
  def perform(notification_id)
    resource = Notification.find(notification_id)
    phone = resource.user.phone
    message = resource.message

    ::TwilioSms.new(phone, message).call
  end
end
