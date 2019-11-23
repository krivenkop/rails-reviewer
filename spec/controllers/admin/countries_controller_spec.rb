require 'rails_helper'

RSpec.describe Admin::CountriesController, type: :controller do
  let(:country) { create(:country) }
  let(:user) { create(:user, :admin) }
  before { sign_in user }

  describe "GET #index" do
    let(:questions) { create_list(:country, 2) }

    before { get :index }

    it "gets all array of countries" do
      expect(assigns(:countries)).to match_array(questions)
    end

    it "renders template index" do
      expect(response).to render_template :index
    end
  end

  describe "POST #new" do
    before { post :new }

    it "assigns a new Country to @country" do
      expect(assigns(:country)).to be_a_new Country
    end

    it "renders template new" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "params is valid" do
      it "saves a new country" do
        count = Country.count
        post :create, params: { country: attributes_for(:country) }
        expect(Country.count).to eq count + 1
      end

      it "redirected to index" do
        post :create, params: { country: attributes_for(:country) }
        expect(response).to redirect_to admin_countries_path
      end
    end

    context 'params is not valid' do
      it "does not save a new country" do
        count = Country.count
        post :create, params: { country: attributes_for(:country, :invalid_name) }
        expect(Country.count).to eq count
      end

      it "renders template new" do
        post :create, params: { country: { name: 'Canada' } }
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    it "renders template edit" do
      get :edit, params: { id: country }
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "gets country by id" do
      patch :update, params: { id: country, country: attributes_for(:country) }
      expect(assigns(:country)).to eq(country)
    end

    context "params is valid" do
      it "successfully updates model" do
        patch :update, params: { id: country, country: { name: 'United States', alpha_three_code: 'USA' } }
        country.reload

        expect(assigns(:country).name).to eq 'United States'
        expect(assigns(:country).alpha_three_code).to eq 'USA'
      end

      it "redirects to index" do
        patch :update, params: { id: country, country: attributes_for(:country) }
        expect(response).to redirect_to admin_countries_path
      end
    end

    context "params is not valid" do
      before { patch :update, params: { id: country, country: attributes_for(:country, :invalid_name) } }
      it "does not update model" do
        country.reload

        expect(country.name).to eq create(:country).name
      end

      it "renders template edit" do
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:country) { create(:country) }

    it "gets country by id" do
      delete :destroy, params: { id: country }
      expect(assigns(:country)).to eq(country)
    end

    it "successfully deletes country" do
      expect { delete :destroy, params: { id: country } }.to change(Country, :count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, params: { id: country }
      expect(response).to redirect_to admin_countries_path
    end
  end

end
