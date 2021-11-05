class TwilioSmsNotifyJob < ApplicationJob
  def perform(message_id:)
    message = Message.find(message_id)

    body = message.prepended_body
    number = message.user.contact_number

    return unless body.present? && number.present?

    ::Twilio::Sms.call(body: body, to_number: number)
  end
end