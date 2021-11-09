require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Attributes' do
    it { should validate_presence_of(:message) }
    it { should validate_length_of(:message).is_at_least(1).is_at_most(160) }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:admin_user) }
  end

  describe 'Callbacks' do
    describe '#notify!' do
      let(:admin_user) { create(:admin_user) }
      let(:user) { create(:user, :with_tenant_role) }
      subject(:message_obj) { build(:message, user: user, admin_user: admin_user) }

      it 'should call the SendSmsJob' do
        expect(SendSmsJob).to receive(:perform_later).with(user, message_obj.message)
        message_obj.save
      end
    end
  end
end
