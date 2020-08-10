class SendTextMessageJob < ApplicationJob
  queue_as :default

  def perform(to_number, body_content)
    init_twilio
    sms = @client.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to: to_number,
        body: body_content
    )
  end


  def init_twilio
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
