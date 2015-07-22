require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  let(:valid_attributes) { attributes_for(:album) }
  let(:invalid_attributes) { valid_attributes }
  let(:valid_session) { {} }
  let(:album) { create(:album) }

  describe "GET #index" do
    it "assigns all albums as @albums" do
      get :index, {user_id: album.user_id}, valid_session
      expect(assigns(:albums)).to eq([album])
    end
  end

  describe "GET #show" do
    it "assigns the requested album as @album" do
      get :show, {:id => album.to_param}, valid_session
      expect(assigns(:album)).to eq(album)
    end
  end

  describe "GET #new" do
    it "assigns a new album as @album" do
      get :new, {user_id: album.user_id}, valid_session
      expect(assigns(:album)).to be_a_new(Album)
    end
  end

  describe "GET #edit" do
    it "redirect to @album withou openid" do
      get :edit, {:id => album.to_param}, valid_session
      expect(response).to redirect_to(album)
    end
    it "render album layout with openid" do
      get :edit, {:id => album.to_param, openid: album.user.openid}, valid_session
      expect(response).to render_template("layouts/album")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Album" do
        album
        expect {
          post :create, {user_id: album.user_id, :album => valid_attributes}, valid_session
        }.to change(Album, :count).by(1)
      end

      it "assigns a newly created album as @album" do
        post :create, {user_id: album.user_id, :album => valid_attributes}, valid_session
        expect(assigns(:album)).to be_a(Album)
        expect(assigns(:album)).to be_persisted
      end

      it "redirects to the created album" do
        post :create, {user_id: album.user_id, :album => valid_attributes}, valid_session
        expect(response).to redirect_to(Album.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved album as @album" do
        #post :create, {:album => invalid_attributes}, valid_session
        #expect(assigns(:album)).to be_a_new(Album)
      end

      it "re-renders the 'new' template" do
        #post :create, {:album => invalid_attributes}, valid_session
        #expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for(:album) }

      it "updates the requested album" do
        put :update, {:id => album.to_param, :album => new_attributes}, valid_session
        album.reload
        expect(album.name).to eq(new_attributes[:name])
      end

      it "assigns the requested album as @album" do
        put :update, {:id => album.to_param, :album => valid_attributes}, valid_session
        expect(assigns(:album)).to eq(album)
      end

      it "redirects to the album" do
        put :update, {:id => album.to_param, :album => valid_attributes}, valid_session
        expect(response).to redirect_to(album)
      end
    end

    context "with invalid params" do
      it "assigns the album as @album" do
        put :update, {:id => album.to_param, :album => invalid_attributes}, valid_session
        expect(assigns(:album)).to eq(album)
      end

      it "re-renders the 'edit' template" do
        #put :update, {:id => album.to_param, :album => invalid_attributes}, valid_session
        #expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested album" do
      album
      expect {
        delete :destroy, {user_id: album.user_id, :id => album.to_param}, valid_session
      }.to change(Album, :count).by(-1)
    end

    it "redirects to the albums list" do
      delete :destroy, {user_id: album.user_id, :id => album.to_param}, valid_session
      expect(response).to redirect_to(user_albums_url(album.user))
    end
  end

end
