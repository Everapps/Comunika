require 'rails_helper'
require 'vcr'

describe "Twilio client" do
  it "sends sms", vcr: true do
    client = TwilioClient.new
    response = client.send_sms("+573013964077", "Hello world")

    expect(response).to be_truthy
    expect(response.status).to eq('queued')
  end
end