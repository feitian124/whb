require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { create(:image) }

  context "validations" do
    it { expect(image).to respond_to(:src) }
  end

  context "callbacks" do
    it "#set_src before create" do
      img = create(:image, src: '')
      openid = img.user.openid
      group = openid[0..2]
      date = img.created_at.strftime('%Y%m%d')
      media_id = img.media_id
      expect(img.src).to eq "uploads/#{group}/#{openid}/#{date}/#{media_id}"
    end
  end
end
