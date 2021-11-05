class User < ApplicationRecord
  belongs_to :community
  has_many  :messages

  validates :contact_number, length: { is: 10 }, allow_blank: true

  enum role:  { tenant: "email", owner: "owner", manager: "manager" }

  ROLES = %w{ tenant owner manager }
end
