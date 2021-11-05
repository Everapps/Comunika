require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:messages) }
    it { should belong_to(:community) }
  end

  subject { create(:user) }

  it { should be_valid }

  context 'validations' do
    let(:valid_contact_number) { %w[123123412345] }
    let(:invalid_contact_number) { %w[123 123456] }

    it { should allow_values(*valid_contact_number).for(:contact_number) }
    it { should_not allow_values(*invalid_contact_number).for(:contact_number) }
  end
end
