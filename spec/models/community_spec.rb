require 'rails_helper'

describe Community, type: :model do
  describe 'Attributes' do
    it { should validate_uniqueness_of(:subdomain).case_insensitive }
  end

  describe 'Associations' do
    it { should have_many(:users) }
  end
end
