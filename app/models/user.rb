class User < ApplicationRecord
  belongs_to :community
  # check for common cases US numbers should be at least 
  # 10 digits-long, i.e. 555 555 55 55 (no spaces)
  validates :contact_number, length: { minimum: 10 }
  ROLES = %w{ tenant owner manager }

  def update_message
    "Dear #{name}, your profile has been updated, please review it at your earliest convenience. Thank you."
  end
end
