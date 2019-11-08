require 'rails_helper'

feature "User can login on website", %q{
  For access to posting and seeing of reviews
  user need to login on website
} do
  given(:user) { User.create(attributes_for(:user)) }

  scenario "Registered user tried to login" do
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'login'

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario "Unregistered user tried to login" do
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'not_valid_pass'
    click_on 'login'

    expect(page).to have_content 'Invalid Email or password.'
  end
end
