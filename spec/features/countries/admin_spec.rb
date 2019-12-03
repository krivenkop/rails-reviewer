require 'rails_helper'

feature "Add new country via admin panel", %q{
  For access to creating, seeing, updating
  and deleting of countries
  user need to login on website and be admin
} do
  context "User is admin" do
    given(:admin) { create(:user, :admin) }
    background { sign_in admin }

    scenario "Admin see an empty list if no items in db" do
      visit admin_countries_path

      expect(page).to have_content 'No items'
    end

    scenario "Admin can see a country from db" do
      country = create :country

      visit admin_countries_path

      within '#admin-countries-table' do
        expect(page).to have_content country.id
        expect(page).to have_content country.name
        expect(page).to have_content country.alpha_three_code
      end
    end

    context "Admin adds new country" do
      background do
        visit admin_countries_path
        expect(page).to have_content 'No items'

        click_on 'Add'
      end

      scenario "valid country" do
        country = build :country
        fill_in 'Name', with: country.name
        fill_in 'Alpha three code', with: country.alpha_three_code
        click_on 'Add'

        within '#admin-countries-table' do
          expect(page).to have_content country.name
          expect(page).to have_content country.alpha_three_code
        end
      end

      scenario "not valid country" do
        country = build :country
        fill_in 'Name', with: country.name
        click_on 'Add'

        within '.admin-form' do
          expect(page).to have_content 'Alpha three code can\'t be blank'
        end
      end
    end


    scenario "Admin removes country", :js => true do
      country = create :country

      visit admin_countries_path

      within '#admin-countries-table' do
        expect(page).to have_content country.id
        expect(page).to have_content country.name
        expect(page).to have_content country.alpha_three_code
      end

      page.accept_confirm do
        click_on 'Destroy'
      end

      expect(page).to have_content 'NO ITEMS'
    end
  end

  context "User is authenticated and not admin" do
    given(:user) { create(:user) }
    background { sign_in user }

    scenario "User doesn't have permissions" do
      pp user.admin?
      visit admin_countries_path

      expect(page).to have_content 'You do not have permissions'
    end
  end

  context "User is not authenticated" do
    scenario "User redirected to login page" do
      visit admin_countries_path

      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end
