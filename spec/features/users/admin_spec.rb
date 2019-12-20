require 'rails_helper'

feature "Add new user via admin panel", %q{
  For access to creating, seeing, updating
  and deleting of users items in database
  user need to login on website and be admin
} do
  context "User is admin" do
    given(:admin) { create(:admin) }
    background { sign_in admin }

    scenario "Admin sees himself if no items in db" do
      visit admin_users_path

      within '#admin-users-table' do
        expect(page).to have_content admin.id
        expect(page).to have_content admin.email
        expect(page).to have_content admin.first_name
        expect(page).to have_content admin.last_name
      end
    end

    scenario "Admin can see a user from db" do
      user = create :user

      visit admin_users_path

      within '#admin-users-table' do
        expect(page).to have_content user.id
        expect(page).to have_content user.email
        expect(page).to have_content user.first_name
        expect(page).to have_content user.last_name
      end
    end

    context "Admin adds new user" do
      background do
        visit admin_users_path

        within '#admin-users-table' do
          expect(page).to have_content admin.id
          expect(page).to have_content admin.email
          expect(page).to have_content admin.first_name
          expect(page).to have_content admin.last_name
        end

        click_on 'Add'
      end

      scenario "valid user" do
        user = build :user

        fill_in 'Email', with: user.email
        fill_in 'First name', with: user.first_name
        fill_in 'Last name', with: user.last_name
        fill_in 'Username', with: user.username
        fill_in 'Password', with: attributes_for(:user)[:password]
        fill_in 'Password confirmation', with: attributes_for(:user)[:password]
        click_on 'Add'

        within '#admin-users-table' do
          expect(page).to have_content admin.id
          expect(page).to have_content admin.email
          expect(page).to have_content user.first_name
          expect(page).to have_content user.last_name
        end
      end

      scenario "not valid user" do
        user = build :user
        fill_in 'Email', with: user.email
        click_on 'Add'

        within '.admin-form' do
          expect(page).to have_content 'First name can\'t be blank'
          expect(page).to have_content 'Last name can\'t be blank'
        end
      end
    end
  end

  context "User is authenticated and not admin" do
    given(:user) { create(:user) }
    background { sign_in user }

    scenario "User doesn't have permissions" do
      visit admin_users_path

      expect(page).to have_content 'You do not have permissions'
    end
  end

  context "User is not authenticated" do
    scenario "User redirected to login page" do
      visit admin_users_path

      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end
