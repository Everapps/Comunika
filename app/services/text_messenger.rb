# frozen_string_literal: true

class TextMessenger < ApplicationService
  def initialize(phone_number:, message:)
    @phone_number = phone_number
    @message = message
  end

  def call
    twilio_client.messages
                 .create({ from: ENV['TWILIO_PHONE_NUMBER'],
                           to: @phone_number,
                           body: @message })
  end

  private

  def twilio_client
    @twilio_client ||= Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end
end
