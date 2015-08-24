# Whb

## Getting Started
This application requires:

- Ruby 2.2.2
- Rails 4.2.1

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

### 运行
* bundle install
* rake db:migrate
* rake bower:install
* rake assets:precompile
* export env
* sudo service nginx restart
* run redis
* RAILS_ENV=production QUEUES=default rake resque:work

### 微信接入

- 验证服务器的有效性. 填写的服务器地址 `url` 应该为 `your_domain/wechat`.


## 使用手册

### 关注/取消关注

1. 用户关注 whb 后, whb 后台会根据 openid 查询微信服务器, 然后为其创建一个账户.
2. 用户取消关注 whb 后, whb 后台会将 subscribe 状态置为 false.
3. 用户再次关注 whb 时, whb 后台会根据 openid 查询账户是否存在, 然后重新启用旧账户或者新间一个.
   (网上有资料说当天取消当天重新关注, openid 相同; 隔天微信会重新分配 openid, 待验证)

### 海报管理
用户关注 whb 后, 就可以进行相册制作和管理等相关操作了.

#### 制作海报

1. 上传图片. 用户点击后, 打开微信图片选择器上传图片, 同时创建一个新相册. 直到相册发布, 后续上传的照片都属于该相册.
上传一张图片后, 微信会返回 `收到 n 张照片, 你可以继续上传, 或者点击这里完善制作.`

2. 编辑海报. 用户可以:
   2.1 修改标题, 描述;
   2.2 修改音乐, 模板;
   2.3 删除图片, 重新排序图片;
   2.4 预览(提示预览后可以发布)
