require 'rails_helper'

RSpec.describe Twilio::Sms, type: :service do
  describe '.call' do
    let(:message) { create(:message) }
    let(:params) { { body: message.prepended_body, to_number: user.contact_number } }
    
    context 'success' do
      let(:user) { create(:user, contact_number: ENV['TWILIO_TO_NUMBER']) }
      it 'should send text' do
        VCR.use_cassette('twilio/sms/valid') do
          expect(described_class.call(params)).to be_truthy
        end
      end
    end
  end
end
