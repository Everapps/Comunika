# include sidekiq web admin console
require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'admin#dashboard'

  # mount the sidekiq route in order to display the sidekiq console
  mount Sidekiq::Web => '/sidekiq' 

  # route for SMS enqueuing
  post 'notifications/send_sms'
end
