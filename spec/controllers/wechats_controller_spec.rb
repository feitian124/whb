require 'rails_helper'

RSpec.describe WechatsController, type: :controller do
  let(:signature_params) do
    timestamp = "1234567"
    nonce = "nonce"
    signature = Digest::SHA1.hexdigest(['weixin_token', timestamp, nonce].sort.join)
    {timestamp: timestamp, nonce: nonce, signature:signature}
  end

  it "verify server url is valid" do
    get :show, signature_params.merge(echostr:"hello")
    expect(response.body).to eq("hello")
  end

end
