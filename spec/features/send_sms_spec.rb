require 'rails_helper'

def login_via_form(email, password)

end

RSpec.describe 'Send SMS', type: :feature do
  AdminUser.delete_all

  admin = AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  user = FactoryBot.create(:user)

  scenario 'login and send sms' do
    visit new_admin_user_session_path
    expect(page).to have_content('Comunika Login')

    fill_in "admin_user_email", with: admin.email
    fill_in "admin_user_password", with: admin.password
    click_button "Login"

    # visit admin_users_path
    expect(page).to have_content('Users')
    click_link "Users"
    expect(page).to have_content('New User')

    visit admin_user_path(user)
    expect(page).to have_content('User Details')
    click_link "Send SMS"
    expect(page).to have_content('SMS enqueued successfully')
  end
end