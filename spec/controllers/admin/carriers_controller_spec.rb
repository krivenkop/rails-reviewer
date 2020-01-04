require 'rails_helper'

RSpec.describe Admin::CarriersController, type: :controller do
  let(:carrier) { create(:carrier) }
  let(:user) { create(:admin) }
  before { sign_in user }

  describe "GET #index" do
    let(:carriers) { create_list(:carrier, 2) }

    before { get :index }

    it "gets all array of carriers" do
      expect(assigns(:carriers)).to match_array(carriers)
    end

    it "assigns a new Carrier to @carrier" do
      expect(assigns(:carrier)).to be_a_new Carrier
    end

    it "renders template index" do
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    context "params is valid" do
      it "saves a new carrier" do
        count = Carrier.count
        post :create, params: { carrier: attributes_for(:carrier) }
        expect(Carrier.count).to eq count + 1
      end

      it "redirected to index" do
        post :create, params: { carrier: attributes_for(:carrier) }
        expect(response).to redirect_to admin_carriers_path
      end
    end

    context 'params is not valid' do
      it "does not save a new carrier" do
        count = Carrier.count
        post :create, params: { carrier: attributes_for(:carrier, :invalid_name) }
        expect(Carrier.count).to eq count
      end

      it "renders template index" do
        post :create, params: { carrier: { name: '' } }
        expect(response).to render_template :index
      end
    end
  end

  describe "PATCH #update" do
    it "gets carrier by id" do
      patch :update, params: { id: carrier, carrier: attributes_for(:carrier) }
      expect(assigns(:carrier)).to eq(carrier)
    end

    context "params is valid" do
      it "successfully updates model" do
        carrier_another_name = attributes_for(:carrier, :another_name)
        patch :update, params: { id: carrier, carrier: carrier_another_name }
        carrier.reload

        expect(assigns(:carrier).name).to eq carrier_another_name[:name]
      end

      it "redirects to index" do
        patch :update, params: { id: carrier, carrier: attributes_for(:carrier) }
        expect(response).to redirect_to admin_carriers_path
      end
    end

    context "params is not valid" do
      before { patch :update, params: { id: carrier, carrier: attributes_for(:carrier, :invalid_name) } }
      it "does not update model" do
        carrier.reload

        expect(carrier.name).to eq create(:carrier).name
      end

      it "renders template index" do
        expect(response).to render_template :index
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:carrier) { create(:carrier) }

    it "gets carrier by id" do
      delete :destroy, params: { id: carrier }
      expect(assigns(:carrier)).to eq(carrier)
    end

    it "successfully deletes carrier" do
      expect { delete :destroy, params: { id: carrier } }.to change(Carrier, :count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, params: { id: carrier }
      expect(response).to redirect_to admin_carriers_path
    end
  end

end
