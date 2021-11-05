module Twilio
  class Sms < Base
    extend ServiceObject
    attr_reader :to_number, :body

    def initialize(body:, to_number:)
      @body = body
      @to_number = to_number
    end

    def call
      send_sms
    end

    private

    def send_sms
      twilio_client
        .messages
        .create({
          body: body,
          to: to_number,
          from: ENV['TWILIO_FROM_NUMBER']
        })
    end
  end
end
