# sidekiq worker
class SmsWorker
  include Sidekiq::Worker

  # perform the sms sending
  def perform(contact_number, message)
    twilio_client = TwilioClient.new()
    twilio_client.send_sms(contact_number, message)
  end
end
