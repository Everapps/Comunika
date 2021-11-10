require 'rails_helper'

RSpec.describe 'TextMessenger' do
  describe '#call' do
    let(:user) { create(:user, :with_tenant_role) }
    let(:message) { 'Hello world!' }

    it 'should call twilio api to send the sms' do
      params = {
        phone_number: user.phone_number,
        message: message
       }

      VCR.use_cassette('twilio/sms') do
        expect(TextMessenger.call(params)).to be_truthy
      end

    end
  end
end