require 'twilio-ruby'

# this pure old ruby object handles the communication between the application 
# and twilio for SMS notifications
class TwilioClient
  # initialize account information and twilio rest client object
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID'] 
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @from = ENV['TWILIO_FROM']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  # send the sms message using the twilio ruby gem
  def send_sms(to, message)
    @client.messages.create(
      from: @from,
      to: to,
      body: message[0..160]
    )
  end
end
