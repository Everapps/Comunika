class Message < ApplicationRecord
  belongs_to :user

  validates :message, length: { maximum: 160 }
end
