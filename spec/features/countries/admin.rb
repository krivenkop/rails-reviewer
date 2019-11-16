require 'rails_helper'

feature "Add new country via admin panel", %q{
  For access to creating, seeing, updating
  and deleting of countries
  user need to login on website and be admin
} do
  context "User is admin" do
    let(:admin) { create(:admin) }

    before { sign_in admin }

    context "Admin see an empty list if no items in db" do
      get admin_countries_path

      expect(page).to have_content 'No items'
    end

    context "Admin can see a country from db" do
      country = Country.new(attributes_for :country)

      get admin_countries_path

      expect(page).to have_content country.id
      expect(page).to have_content country.name
      expect(page).to have_content country.alpha_three_code
    end

    context "Admin adds new country" do
      get admin_countries_path
      expect(page).to have_content 'No items'

      click_on 'Add new'

      country_attrs = attributes_for :country
      fill_in 'Name', country_attrs['name']
      fill_in 'Alpha three code', country_attrs['alpha_three_code']
      click_on 'Add'

      expect(page).to have_content country['name']
      expect(page).to have_content country['alpha_three_code']
    end

    context "Admin adds new no valid country" do
      get admin_countries_path
      expect(page).to have_content 'No items'

      click_on 'Add new'

      country_attrs = attributes_for :country
      fill_in 'Name', country_attrs['name']
      click_on 'Add'

      expect(page).to have_content 'Alpha three code can not be empty'
    end


    context "Admin removes country" do
      country = Country.new(attributes_for :country)

      get admin_countries_path

      expect(page).to have_content country.id
      expect(page).to have_content country.name
      expect(page).to have_content country.alpha_three_code

      click_on '.country__delete'
      click_on 'Confirm'

      expect(page).to have_content 'No items'
    end
  end

  context "User is authenticated and not admin" do
    let(:user) { create(:user) }
    before { sign_in user }

    context "User doesn't have permissions" do
      get admin_countries_path

      expect(page).to have_content 'You do not have permissions'
    end
  end

  context "User is not authenticated" do
    scenario "User redirected to login page" do
      get admin_countries_path

      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end
