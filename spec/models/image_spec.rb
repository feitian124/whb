require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { create(:image) }

  context "validations" do
    it { expect(image).to respond_to(:src) }
  end

  context "methods" do
    it "#upload" do
      image.pic_url = 'http://ruby-china-files.b0.upaiyun.com/photo/5982eaaa64f467d9dbda03ad4f40ea27.png'
      saved = image.upload
      expect(saved).to eq true
    end
  end

end
