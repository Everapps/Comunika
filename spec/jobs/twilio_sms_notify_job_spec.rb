require 'rails_helper'

RSpec.describe TwilioSmsNotifyJob, type: :job do
  let(:user) { create(:user) }
  let(:message) { create(:message, user: user) }

  describe '#perform' do
    context 'success' do
      it 'should call job' do
        expect(::Twilio::Sms).to receive(:call).with(body: message.prepended_body, to_number: message.user.contact_number)
        described_class.perform_now(message_id: message.id)
      end
    end
  end
end
