require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
  end

  let(:user) { create(:user) }
  subject { create(:message, user: user) }

  it { should be_valid }

  describe '#notify_user' do
    it 'should call job' do
      expect(TwilioSmsNotifyJob).to receive(:perform_later).with(message_id: subject.id)
      subject.notify_user
    end
  end

  describe '#prepended_body' do
    context 'tenant role' do
      let(:user) { create(:user, :tenant) }
      it 'should prepend' do
        expect(subject.prepended_body).to include('To Tenant:')
      end
    end
    context 'manager role' do
      let(:user) { create(:user, :manager) }
      it 'should not prepend' do
        expect(subject.prepended_body).to eq(subject.body)
      end
    end
    context 'owner role' do
      let(:user) { create(:user, :owner) }
      it 'should prepend' do
        expect(subject.prepended_body).to include('To Owner:')
      end
    end
  end
end
