require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  let(:user) { create(:user, :admin) }
  before { sign_in user }

  describe "GET #index" do
    let(:users) { create_list(:user, 2) }

    before { get :index }

    it "gets all array of users" do
      expect(assigns(:users)).to match_array(users.prepend user)
    end

    it "renders template index" do
      expect(response).to render_template :index
    end
  end

  describe "POST #new" do
    before { post :new }

    it "assigns a new user to @user" do
      expect(assigns(:user)).to be_a_new user
    end

    it "renders template new" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "params is valid" do
      it "saves a new user" do
        count = user.count
        post :create, params: { user: attributes_for(:user) }
        expect(user.count).to eq count + 1
      end

      it "redirected to index" do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to redirect_to admin_users_path
      end
    end

    context 'params is not valid' do
      it "does not save a new user" do
        count = user.count
        post :create, params: { user: attributes_for(:user, :invalid_name) }
        expect(user.count).to eq count
      end

      it "renders template new" do
        post :create, params: { user: { name: 'Canada' } }
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    it "renders template edit" do
      get :edit, params: { id: user }
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "gets user by id" do
      patch :update, params: { id: user, user: attributes_for(:user) }
      expect(assigns(:user)).to eq(user)
    end

    context "params is valid" do
      it "successfully updates model" do
        attributes = attributes_for :user
        patch :update, params: { id: user, user: attributes }
        user.reload

        expect(assigns(:user).email).to eq attributes[:email]
      end

      it "redirects to index" do
        patch :update, params: { id: user, user: attributes_for(:user) }
        expect(response).to redirect_to admin_users_path
      end
    end

    context "params is not valid" do
      before { patch :update, params: { id: user, user: attributes_for(:user, :another_first_name) } }

      it "does not update model" do
        user.reload

        expect(user.first_name).to eq build(:user).first_name
      end

      it "renders template edit" do
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:person) { create(:user) }

    it "gets user by id" do
      delete :destroy, params: { id: person }
      expect(assigns(:person)).to eq(person)
    end

    it "successfully deletes user" do
      expect { delete :destroy, params: { id: person } }.to change(person, :count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, params: { id: person }
      expect(response).to redirect_to admin_users_path
    end
  end

end
