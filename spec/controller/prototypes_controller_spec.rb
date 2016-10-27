require "rails_helper"
require "pry-rails"
describe PrototypesController, type: :controller do
  login_user

  let(:user){ create(:user)}
  let(:prototype){create(:prototype)}
  let(:params){attributes_for(:prototype)}
  let(:params_invalid){attributes_for(:prototype, content:"")}

    describe 'GET #index' do

      it "assigns the requested prototypes to @prototypes" do
        prototypes = create_list(:prototype, 5)
        get :index
        expect(assigns(:prototypes)).to match(prototypes.sort{|a, b| b.likes_count <=> a.likes_count })
      end

      it "returns the :index template" do
        get :index
        expect(response).to render_template :index
      end

    end

    describe 'GET #new' do

      it "assigns the requested "do
        prototype = Prototype.new
        get :new, id: prototype
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end

      it "returns the :new template" do
        get :new, id: prototype
        expect(response).to render_template :new
      end

    end

    describe 'POST #create' do
      before do
        params_invalid
      end
      context 'with valid attributes' do

        it "saves the new prototype in the database" do
          expect{post :create, prototype: params}.to change(Prototype, :count).by(1)
        end

        it "redirects to root_path" do
          post :create,id: prototype, prototype: params
          expect(response).to redirect_to :root
        end

        it "shows flash messages to show save the prototype successfully" do
          post :create,id: prototype, prototype: params
          expect(flash[:success]).to be_present
        end

      end
      context "with invalid attributes" do

        it "does not save the new prototype in the database" do
          expect{post :create, prototype: params_invalid}.to change(Prototype, :count).by(0)
        end

        it "redirects new_prototype_path" do
          post :create, prototype: params_invalid
          expect(response).to redirect_to new_prototype_path
        end

        it "shows flash message to show save the prototype unsuccessfully" do
          post :create, prototype: params_invalid
          expect(flash[:danger]).to be_present
        end

      end

    end

    describe 'GET #show' do
      it "assigns the requested prototype to @prototype" do
        capturedimage = create(:capturedimage, :with_mainimage, prototype: prototype)
        get :show, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

      it "assigns the requested comment to @comment" do
        comment = Comment.new(prototype: prototype, user: user)
        get :show, id: prototype
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "assigns like association with rototype to @likes" do
        like =  create_list(:like,5, prototype: prototype)
        get :show, id: prototype
        expect(assigns(:likes)).to eq like
      end

      it "render the :edit template" do
        get :show, id: prototype
        expect(response).to render_template :show
      end

    end

    describe 'GET #edit' do

      it "assigns the requested prototype to @prototype" do
        get :edit, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

      it "assigns mainimage to @mainimage" do
        mainimage = create(:capturedimage, :with_mainimage, prototype: prototype)
        get :edit, id: prototype
        expect(assigns(:mainimage)).to eq mainimage
      end

      it "assigns subimage to @subimage" do
        subimage = create_list(:capturedimage, 2, :with_subimage, prototype: prototype)
        get :edit, id: prototype
        expect(assigns(:subimage)).to eq subimage
      end

      it "renders the :edit template" do
        get :edit, id: prototype
        expect(response).to render_template :edit
      end

    end

    describe 'PATCH #update' do
      context "with valid attributes" do

        it "assigns the requested prototype to @prototype" do
          patch :update, id: prototype, prototype: params
          expect(assigns(:prototype)).to eq prototype
        end


        it "update atributes of prototype" do
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          patch :update, id: prototype, prototype: attributes_for(:prototype, content:"テストテストテスト" )
          prototype.reload
          expect(prototype.content).to eq ("テストテストテスト")
        end

        it "reirects to root_path" do
          patch :update, id: prototype, prototype: params
          expect(response).to redirect_to :root
        end

        it "shows flash message to show update prototype successfully" do
          patch :update, id: prototype, prototype: params
          expect(flash[:success]).to be_present
        end

      end

      context 'with invalid attributes ' do

        it "does not save the new prototype" do
          prototype = create(:prototype)
          expect{patch :update, id: prototype, prototype: attributes_for(:prototype, content:"")}.to change(Prototype, :count).by(0)
        end

        it "renders the :edit template" do
          # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          patch :update,id: prototype, prototype: params_invalid
          expect(response).to redirect_to edit_prototype_path
        end

        it "shows flash message to show update prototype unsuccessfully" do
          # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          patch :update, id: prototype, prototype: params_invalid
          expect(flash[:danger]).to be_present
        end

      end

    end

    describe 'DELETE #destroy' do
      before do
        prototype
      end
      it "assigns the requested prototype @prototype" do
        delete :destroy, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

      it "delete the prototype" do
        expect{delete :destroy, id: prototype}.to change(Prototype, :count).by(0)
      end

      it "redirects to root_path" do
        delete :destroy, id: prototype
        expect(response).to redirect_to :root
      end

      it "shows flash message to show delete prototype successfully" do
        delete :destroy, id: prototype
        expect(flash[:success]).to be_present
      end

  end

end
