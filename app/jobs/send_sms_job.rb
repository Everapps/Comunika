class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(user, message)
    TextMessenger.call(phone_number: user.phone_number,
                       message: message)
  end
end
