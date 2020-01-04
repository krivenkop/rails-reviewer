require 'rails_helper'

feature "Add new carrier via admin panel", %q{
  For access to creating, seeing, updating
  and deleting of carriers
  user need to login on website and be admin
} do
  context "User is admin" do
    given(:admin) { create(:admin) }
    background { sign_in admin }

    scenario "Admin see an empty list if no items in db" do
      visit admin_carriers_path

      expect(page).to have_content 'No items'
    end

    scenario "Admin can see a carrier from db" do
      carrier = create :carrier

      visit admin_carriers_path

      within '#admin-carriers-table' do
        expect(page).to have_content carrier.id
        expect(page).to have_content carrier.name
        expect(page).to have_content carrier.slug
      end
    end

    context "Admin adds new carrier" do
      background do
        visit admin_carriers_path
        expect(page).to have_content 'No items'
      end

      scenario "valid carrier" do
        carrier = build :carrier
        carrier.generate_slug!
        fill_in 'Name', with: carrier.name
        click_on 'Add'

        within '#admin-carriers-table' do
          expect(page).to have_content carrier.name
          expect(page).to have_content carrier.slug
        end
      end

      scenario "not valid carrier" do
        carrier = build(:carrier, :invalid_name)
        fill_in 'Name', with: carrier.name
        click_on 'Add'

        within '.admin-form' do
          expect(page).to have_content 'Name can\'t be blank'
        end
      end
    end


    scenario "Admin removes carrier", :js => true do
      carrier = create :carrier

      visit admin_carriers_path

      within '#admin-carriers-table' do
        expect(page).to have_content carrier.id
        expect(page).to have_content carrier.name
        expect(page).to have_content carrier.slug
      end

      page.accept_confirm do
        click_on 'Destroy'
      end

      expect(page).to have_content 'No items'
    end
  end

  context "User is authenticated and not admin" do
    given(:user) { create(:user) }
    background { sign_in user }

    scenario "User doesn't have permissions" do
      pp user.admin?
      visit admin_carriers_path

      expect(page).to have_content 'You do not have permissions'
    end
  end

  context "User is not authenticated" do
    scenario "User redirected to login page" do
      visit admin_carriers_path

      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end
