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

      within 'table.users__table' do
        expect(page).to have_content 'No items'
      end
    end

    scenario "Admin can see a country from db" do
      country = Country.new(attributes_for :country)

      visit admin_countries_path

      within 'table.users__table' do
        expect(page).to have_content country.id
        expect(page).to have_content country.name
        expect(page).to have_content country.alpha_three_code
      end
    end

    context "Admin adds new country" do
      background do
        visit admin_countries_path
        within 'table.users__table' do
          expect(page).to have_content 'No items'
        end

        click_on 'Add new'
      end

      scenario "valid country" do
        country = build :country
        fill_in 'Name', country.name
        fill_in 'Alpha three code', country.alpha_three_code
        click_on 'Add'

        within 'table.users__table' do
          expect(page).to have_content country.name
          expect(page).to have_content country.alpha_three_code
        end
      end

      scenario "not valid country" do
        country = build :country
        fill_in 'Name', country.name
        click_on 'Add'

        within 'table.users__table' do
          expect(page).to have_content 'Alpha three code can not be empty'
        end
      end
    end


    scenario "Admin removes country" do
      country = create :country

      visit admin_countries_path

      within 'table.users__table' do
        expect(page).to have_content country.id
        expect(page).to have_content country.name
        expect(page).to have_content country.alpha_three_code
      end

      click_on '.country__delete'
      click_on 'Confirm'

      within 'table.users__table' do
        expect(page).to have_content 'No items'
      end
    end
  end

  context "User is authenticated and not admin" do
    given(:user) { create(:user) }
    background { sign_in user }

    scenario "User doesn't have permissions" do
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
