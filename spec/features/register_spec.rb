require 'rails_helper'

feature "Client can be registered at website", %q{
  For using a website client need to create
  personal user record in db
} do
  before { visit new_user_registration_path }
  given(:user_params) { attributes_for(:user) }

  scenario "client leaved email field empty" do
    fill_in 'user_first_name', with: user_params[:first_name]
    fill_in 'user_last_name', with: user_params[:last_name]
    fill_in 'user_password', with: user_params[:password]
    fill_in 'user_password_confirmation', with: user_params[:password]
    fill_in 'user_username', with: user_params[:username]

    click_on "Sign up"

    expect(page).to have_content 'Email can\'t be blank'
  end

  scenario "client leaved password field empty" do
    fill_in 'user_first_name', with: user_params[:first_name]
    fill_in 'user_last_name', with: user_params[:last_name]
    fill_in 'user_email', with: user_params[:email]
    fill_in 'user_username', with: user_params[:username]

    click_on "Sign up"

    expect(page).to have_content 'Password can\'t be blank'
  end

  scenario "client leaved first_name field empty" do
    fill_in 'user_last_name', with: user_params[:last_name]
    fill_in 'user_email', with: user_params[:email]
    fill_in 'user_password', with: user_params[:password]
    fill_in 'user_password_confirmation', with: user_params[:password]
    fill_in 'user_username', with: user_params[:username]

    click_on "Sign up"

    expect(page).to have_content 'First name can\'t be blank'
  end

  scenario "client leaved last_name field empty" do
    fill_in 'user_first_name', with: user_params[:first_name]
    fill_in 'user_email', with: user_params[:email]
    fill_in 'user_password', with: user_params[:password]
    fill_in 'user_password_confirmation', with: user_params[:password]
    fill_in 'user_username', with: user_params[:username]

    click_on "Sign up"

    expect(page).to have_content 'Last name can\'t be blank'
  end

  scenario "client leaved username field empty" do
    fill_in 'user_first_name', with: user_params[:first_name]
    fill_in 'user_last_name', with: user_params[:last_name]
    fill_in 'user_email', with: user_params[:email]
    fill_in 'user_password', with: user_params[:password]
    fill_in 'user_password_confirmation', with: user_params[:password]

    click_on "Sign up"

    expect(page).to have_content 'Username can\'t be blank'
  end

  scenario "client filled in different values in password and password confirmation" do
    fill_in 'user_first_name', with: user_params[:first_name]
    fill_in 'user_last_name', with: user_params[:last_name]
    fill_in 'user_email', with: user_params[:email]
    fill_in 'user_password', with: user_params[:password]
    fill_in 'user_username', with: user_params[:username]
    fill_in 'user_password_confirmation', with: 'not_valid_password_confirmation'

    click_on "Sign up"

    expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end

  scenario "client successfully filled all fields" do
    fill_in 'user_first_name', with: user_params[:first_name]
    fill_in 'user_last_name', with: user_params[:last_name]
    fill_in 'user_username', with: user_params[:username]
    fill_in 'user_email', with: user_params[:email]
    fill_in 'user_password', with: user_params[:password]
    fill_in 'user_password_confirmation', with: user_params[:password]

    click_on "Sign up"

    expect(page).to have_content 'You have signed up successfully.'
  end

end
