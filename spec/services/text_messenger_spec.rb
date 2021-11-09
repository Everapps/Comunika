require 'rails_helper'

RSpec.describe 'TextMessenger' do
  xdescribe '#call' do
    let(:user) { create(:user, :with_tenant_role) }
    let(:message) { 'Hello world!' }

    it 'should call twilio api to send the sms' do
      params = {
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: user.phone_number,
        body: message
       }

    end
  end
end