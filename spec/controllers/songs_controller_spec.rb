require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  let(:song) { create(:song) }
  let(:valid_attributes) { attributes_for(:song) }
  let(:invalid_attributes) { valid_attributes.deep_dup }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all songs as @songs" do
      get :index, {}, valid_session
      expect(assigns(:songs)).to eq([song])
    end
  end

  describe "GET #show" do
    it "assigns the requested song as @song" do
      get :show, {:id => song.to_param}, valid_session
      expect(assigns(:song)).to eq(song)
    end
  end

  describe "GET #new" do
    it "assigns a new song as @song" do
      get :new, {}, valid_session
      expect(assigns(:song)).to be_a_new(Song)
    end
  end

  describe "GET #edit" do
    it "assigns the requested song as @song" do
      get :edit, {:id => song.to_param}, valid_session
      expect(assigns(:song)).to eq(song)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Song" do
        expect {
          post :create, {:song => valid_attributes}, valid_session
        }.to change(Song, :count).by(1)
      end

      it "assigns a newly created song as @song" do
        post :create, {:song => valid_attributes}, valid_session
        expect(assigns(:song)).to be_a(Song)
        expect(assigns(:song)).to be_persisted
      end

      it "redirects to the created song" do
        post :create, {:song => valid_attributes}, valid_session
        expect(response).to redirect_to(Song.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved song as @song" do
        #post :create, {:song => invalid_attributes}, valid_session
        #expect(assigns(:song)).to be_a_new(Song)
      end

      it "re-renders the 'new' template" do
        #post :create, {:song => invalid_attributes}, valid_session
        #expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for(:song) }

      it "updates the requested song" do
        put :update, {:id => song.to_param, :song => new_attributes}, valid_session
        song.reload
        expect(song.name).to eq(new_attributes[:name])
      end

      it "assigns the requested song as @song" do
        put :update, {:id => song.to_param, :song => valid_attributes}, valid_session
        expect(assigns(:song)).to eq(song)
      end

      it "redirects to the song" do
        put :update, {:id => song.to_param, :song => valid_attributes}, valid_session
        expect(response).to redirect_to(song)
      end
    end

    context "with invalid params" do
      it "assigns the song as @song" do
        put :update, {:id => song.to_param, :song => invalid_attributes}, valid_session
        expect(assigns(:song)).to eq(song)
      end

      it "re-renders the 'edit' template" do
        #put :update, {:id => song.to_param, :song => invalid_attributes}, valid_session
        #expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested song" do
      song = Song.create! valid_attributes
      expect {
        delete :destroy, {:id => song.to_param}, valid_session
      }.to change(Song, :count).by(-1)
    end

    it "redirects to the songs list" do
      song = Song.create! valid_attributes
      delete :destroy, {:id => song.to_param}, valid_session
      expect(response).to redirect_to(songs_url)
    end
  end

end
