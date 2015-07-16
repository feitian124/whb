require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:song) { create(:song) }

  context "validations" do
    it { expect(song).to respond_to(:src) }
  end
end
