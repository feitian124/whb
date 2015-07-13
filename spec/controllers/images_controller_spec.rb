require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:image) { create(:image) }
  let(:valid_attributes) { attributes_for(:image) }
  let(:invalid_attributes) { valid_attributes.deep_dup }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all images as @images" do
      get :index, {:user_id => image.album.user_id}, valid_session
      expect(assigns(:images)).to eq([image])
    end
  end

  describe "GET #show" do
    it "assigns the requested image as @image" do
      get :show, {:id => image.to_param, :user_id => image.album.user_id}, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe "GET #new" do
    it "assigns a new image as @image" do
      get :new, {:user_id => image.album.user_id}, valid_session
      expect(assigns(:image)).to be_a_new(Image)
    end
  end

  describe "GET #edit" do
    it "assigns the requested image as @image" do
      get :edit, {:id => image.to_param}, valid_session
      expect(assigns(:image)).to eq(image)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Image" do
        user_id = image.album.user_id
        expect {
          post :create, {:image => valid_attributes, :user_id => user_id}, valid_session
        }.to change(Image, :count).by(1)
      end

      it "assigns a newly created image as @image" do
        post :create, {:image => valid_attributes, :user_id => image.album.user_id}, valid_session
        expect(assigns(:image)).to be_a(Image)
        expect(assigns(:image)).to be_persisted
      end

      it "redirects to the created image" do
        post :create, {:image => valid_attributes, :user_id => image.album.user_id}, valid_session
        expect(response).to redirect_to(Image.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved image as @image" do
        #post :create, {:image => invalid_attributes, :user_id => image.album.user_id}, valid_session
        #expect(assigns(:image)).to be_a_new(Image)
      end

      it "re-renders the 'new' template" do
        #post :create, {:image => invalid_attributes, :user_id => image.album.user_id}, valid_session
        #expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for(:image) }

      it "updates the requested image" do
        put :update, {:id => image.to_param, :image => new_attributes}, valid_session
        image.reload
        expect(image.name).to eq(new_attributes[:name])
      end

      it "assigns the requested image as @image" do
        put :update, {:id => image.to_param, :image => valid_attributes}, valid_session
        expect(assigns(:image)).to eq(image)
      end

      it "redirects to the image" do
        put :update, {:id => image.to_param, :image => valid_attributes}, valid_session
        expect(response).to redirect_to(image)
      end
    end

    context "with invalid params" do
      it "assigns the image as @image" do
        put :update, {:id => image.to_param, :image => invalid_attributes}, valid_session
        expect(assigns(:image)).to eq(image)
      end

      it "re-renders the 'edit' template" do
        #put :update, {:id => image.to_param, :image => invalid_attributes}, valid_session
        #expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested image" do
      image_id = image.to_param
      expect {
        delete :destroy, {:id => image_id}, valid_session
      }.to change(Image, :count).by(-1)
    end

    it "redirects to the images list" do
      delete :destroy, {:id => image.to_param}, valid_session
      expect(response).to redirect_to(user_images_url(image.album.user))
    end
  end

end
