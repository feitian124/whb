require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { create(:image) }

  context "validations" do
    it { expect(image).to respond_to(:src) }
  end

  context "carrierwave" do
    it "does upload image" do
      file = File.open(Rails.root.join('public/images/music-icon.png'))
      image = Image.new(src: file)
      image.save
      expect(image.errors.count).to eq 0
    end
  end

  context "methods" do
    it "url == pic_url" do
      expect(image.url).to eq image.pic_url
    end
    it "url == src.url" do
      file = File.open(Rails.root.join('public/images/music-icon.png'))
      image = Image.new(src: file)
      expect(image.url).to eq image.src.url
    end
  end

end
