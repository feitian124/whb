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
  let(:txt_message){message_base.merge(:MsgType => "text", :Content => "txt message content")}
  let(:image_message){message_base.merge(:MsgType => "image", :MediaId => "1234567890", :PicUrl => "http://localhost:3000/1.jpg")}
  let(:my_haibao_message){message_base.merge(:MsgType => "event", :Event => "CLICK", :EventKey => "MY_HAIBAO")}
  let(:subscribe_message){message_base.merge(:MsgType => "event", :Event => "subscribe")}

  it "verify server url is valid" do
    get :show, signature_params.merge(echostr:"hello")
    expect(response.body).to eq("hello")
  end

  it "on image" do
   # expect {
   #   post :create, {:xml => image_message}, valid_session
   # }.to change(Image, :count).by(1)
  end

  it "on subscribe" do
    subscribe_message[:FromUserName] = 'o3l6gs_DLc1sHiCkr_pnnEO0zF64'
    post :create, {:xml => subscribe_message}.merge(signature_params), valid_session
    expect(response.status).to eq(200)
  end

  it "on MY_HAIBAO" do
    expect {
      # 因为 openid 不对, 所以肯定异常
      post :create, {:xml => my_haibao_message}.merge(signature_params), valid_session
    }.to raise_error(Wechat::ResponseError)
  end

  it "on text" do
    post :create, {:xml => txt_message}.merge(signature_params), valid_session
    expect(response.status).to eq(200)
  end

  it "#redirect" do
    # 因为需要先获得用户同意授权的 code, 这里 code 不对肯定异常
    expect {
      get :redirect, {code: 'code', state: 'state'}
    }.to raise_error(Wechat::ResponseError)
  end
end
