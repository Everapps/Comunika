module Twilio
  class Base
    TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
    TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

    private

    def twilio_client
      @twilio_client ||= Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
    end
  end
end
