require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { build(:image) }

  context "validations" do
    it { expect(image).to respond_to(:src) }
  end
end
