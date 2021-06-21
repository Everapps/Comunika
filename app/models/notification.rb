class Notification < ApplicationRecord
  belongs_to :user

  after_create :send_notification

   def set_locale
      self.locale = I18n.locale
   end

  validates :message, presence: true, length: { minimum: 2, maximum: 160 }

  protected

  def send_notification
    TwilioSmsJob.perform_later(id)
  end
end
