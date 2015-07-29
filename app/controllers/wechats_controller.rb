class WechatsController < ApplicationController
  wechat_responder

  # 处理图片信息
  # 以后"下载文件"可能需要放到后台任务, 防止阻塞?
  on :image do |request|
    begin
      tmp_file = wechat.media request[:MediaId]
      user = User.find_by(openid: request[:FromUserName])
      img = user.latest_album.images.create({
        src: tmp_file,
        media_id: request[:MediaId],
        msg_id: request[:MsgId],
        pic_url: request[:PicUrl]
      })
      count = user.latest_album.images.length
      msg = %Q{收到 #{count} 张照片, 你可以继续上传, 或者<a href="http://#{WECHAT_CONFIG[:domain]}/albums/#{user.latest_album.id}/edit?openid=#{user.openid}">点击这里下一步制作</a>}
      request.reply.text msg
    rescue => e
      puts "处理上传图片失败, 媒体编号#{request[:MediaId]}"
      puts e
      request.reply.text "从微信服务器拉取图片失败, 图片编号[#{request[:MediaId]}]" #Just echo
    end
  end

  # 用户关注
  on :event, with: "subscribe" do |request|
    user_json = wechat.user request[:FromUserName]
    old = User.find_by_openid request[:FromUserName]
    if old
      old.update!(user_json)
      request.reply.text "欢迎再次关注~"
    else
      User.create!(user_json)
      request.reply.text "欢迎关注~"
    end
  end

  # 用户取消关注
  on :event, with: "unsubscribe" do |request|
    user = User.find_by_openid request[:FromUserName]
  end

  # 查看我的海报
  on :event, with: "MY_HAIBAO" do |request|
    user = User.find_by_openid request[:FromUserName]
    request.reply.news(0...1) do |article, i|
      article.item title: "我的微海报",
                   description: "你共有#{user.albums.length}条微海报, 点击查看吧~",
                   pic_url: "http://#{WECHAT_CONFIG[:domain]}/assets/albums_cover.jpg",
                   url: "http://#{WECHAT_CONFIG[:domain]}/users/#{user.id}/albums"
    end
  end

  # 默认的文字信息responder
  on :text do |request, content|
    request.reply.text "echo: #{content}" #Just echo
  end

  # 当请求的文字信息内容为'help'时, 使用这个responder处理
  on :text, with:"help" do |request, help|
    request.reply.text "help content: #{wechat.jsapi_ticket.ticket}" #回复帮助信息
  end

  # 当请求的文字信息内容为'<n>条新闻'时, 使用这个responder处理, 并将n作为第二个参数
  on :text, with: /^(\d+)条新闻$/ do |request, count|
    articles_range = (0... [count.to_i, 10].min)
    request.reply.news(articles_range) do |article, i| #回复"articles"
      article.item title: "标题#{i}", description:"内容描述#{i}", pic_url: "http://www.baidu.com/img/bdlogo.gif", url:"http://www.baidu.com/"
    end
  end

  # 处理语音信息
  on :voice do |request|
    request.reply.voice(request[:MediaId]) #直接语音音返回给用户
  end

  # 处理视频信息
  on :video do |request|
    nickname = wechat.user(request[:FromUserName])["nickname"] #调用 api 获得发送者的nickname
    request.reply.video(request[:MediaId], title: "回声", description: "#{nickname}发来的视频请求") #直接视频返回给用户
  end

  # 处理地理位置信息
  on :location do |request|
    request.reply.text("#{request[:Location_X]}, #{request[:Location_Y]}") #回复地理位置
  end


  # 当无任何responder处理用户信息时,使用这个responder处理
  on :fallback do |request|
    request.reply.text "fallback"
  end
end
