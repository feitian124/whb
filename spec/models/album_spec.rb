require 'rails_helper'

RSpec.describe Album, type: :model do
  let(:album) { create(:album) }

  context "validations" do
    it { expect(album).to respond_to(:user) }
  end
end
