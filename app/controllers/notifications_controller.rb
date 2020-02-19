# handles the notifications to users via SMS with twilio gem
class NotificationsController < ApplicationController
  def send_sms
    user = User.find_by(id: resource_params["id"])
    if user
      SmsWorker.perform_async(user.contact_number, user.update_message) # enqueue the asynchronous sidekiq task

      flash[:notice] = 'SMS enqueued successfully' # let the user know the SMS was enqueued to be sent
      redirect_to admin_user_path(user) # get back to the user and display the flash notice
    else
      flash[:notice] = 'Unable to send SMS'
      redirect_to admin_user_path(user) # get back to the user and display the flash notice
    end
  end

  def resource_params
    JSON.parse(params['resource']) # parse the resource for better handling
  end
end