require 'rails_helper'

RSpec.describe WechatsController, type: :controller do
  let(:valid_session) { {} }
  let(:signature_params) do
    timestamp = "1234567"
    nonce = "nonce"
    signature = Digest::SHA1.hexdigest(['weixin_token', timestamp, nonce].sort.join)
    {timestamp: timestamp, nonce: nonce, signature:signature}
  end
  let(:message_base) do
    {
      :ToUserName => "toUser",
      :FromUserName => "fromUser",
      :CreateTime => "1348831860",
      :MsgId => "1234567890123456",
    }
  end
  let(:image_message){message_base.merge(:MsgType => "image", :MediaId => "1234567890", :PicUrl => "http://localhost:3000/1.jpg")}

  it "verify server url is valid" do
    get :show, signature_params.merge(echostr:"hello")
    expect(response.body).to eq("hello")
  end

  it "on image" do
    expect {
      post :create, {:xml => image_message}, valid_session
    }.to change(Image, :count).by(1)

  end
end
