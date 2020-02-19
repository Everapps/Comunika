require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User updates" do
    let(:user) { FactoryBot.create(:user) }

    it "can update contact number" do
      user.update(contact_number: Faker::PhoneNumber.phone_number)
      expect(user.contact_number).to be_truthy
      expect(user.contact_number.length).to be > 0
    end

    it "validates contact number length" do
      user.contact_number = "12"
      expect(user).to_not be_valid
      expect(user.errors[:contact_number].first).to include("is too short")
    end
  end
end
