require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context "validations" do
    it { expect(user).to respond_to(:openid) }
  end
end
