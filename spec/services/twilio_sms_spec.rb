require 'rails_helper'

RSpec.describe TwilioSms, vcr: true do
  let(:client) { TwilioSms.new('9168992758', 'Hello world') }
  let(:response) { client.call}

  before { response }

  it 'sends sms' do
    expect(response).to be_truthy
  end

  it 'adds to queue' do
    expect(response.status).to eq('queued')
  end
end
