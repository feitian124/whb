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

end
