require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should belong_to(:community) }
    it { should have_many(:messages) }
  end

  describe 'Class Methods' do
    before :each do
      create(:user, :with_tenant_role)
      create(:user, :with_owner_role)
      create(:user, :with_manager_role)
    end

    describe '#managers' do
      it 'should return alluser swith manager role' do
        expect(User.managers.size).to eql(1)
      end
    end

    describe '#owners' do
      it 'should return all users with owner role' do
        expect(User.owners.size).to eql(1)
      end
    end
  end
end
