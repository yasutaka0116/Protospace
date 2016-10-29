require "rails_helper"
require "pry-rails"

describe UsersController, type: :controller do

    let(:user) { create(:user) }
    let(:params) {
      {id: user.id,
      user: attributes_for(:user)}
    }
  describe "with user login" do
    login_user

  describe  'GET #show' do

    it "assigns the requested to @user" do
      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it 'renders the :show template' do
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe  'GET #edit' do

    it "assigns the requested user to @user" do
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the :edit template" do
      get :edit, id: user
      expect(response).to render_template :edit
    end

  end

  describe  'PATCH #update' do

    it "assigns the requested user to @user" do
      patch :update, id: user, user: params
      expect(user).to eq user
    end


    it "change @user's attributes" do
      hoge ="hoge"
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      patch :update, id: user, user: attributes_for(:user, name: "hoge")
      user.reload
      expect(user.name).to eq("hoge")
    end

    it "redirects root path" do
      patch :update, id: user, user: params
      expect(response).to redirect_to :root
    end

    it "sends flash messages" do
      patch :update, id: user, user: params
      expect(flash[:success]).to be_present
    end

  end
end
  describe "without user login" do
    describe "GET #edit" do
      it "redirects sign_in page" do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe "PATCH #update" do
      it "redirects sign_in page" do
        patch :update, id: user, user: params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end


end
