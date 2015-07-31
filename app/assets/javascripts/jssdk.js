$(function() {
  wx.ready(function(){
    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，
    // 所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。
    // 对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。

    // 分享给朋友圈
    wx.onMenuShareTimeline({
      title: 'TOP科技',
      link: 'http://www.getxrp.com/albums/1',
      imgUrl: 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
      trigger: function (res) {
        //alert('用户点击分享到朋友圈');
      },
      success: function (res) {
        //alert('已分享');
      },
      cancel: function (res) {
        //alert('已取消');
      },
      fail: function (res) {
        //alert('失败:'+JSON.stringify(res));
      }
    });

    // 分享给朋友
    wx.onMenuShareAppMessage({
      title: 'TOP科技',
      link: 'http://www.getxrp.com/albums/1',
      imgUrl: 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
      desc: '测试一下分享给朋友', // 分享描述
      type: '', // 分享类型,music、video或link，不填默认为link
      dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
      success: function () {
        //console.log('onMenuShareAppMessage success');
      },
      cancel: function () {
        //console.log('onMenuShareAppMessage cancel');
      }
    });

    // 隐藏不需要的菜单
    wx.hideMenuItems({
      menuList: [
        'menuItem:readMode', // 阅读模式
        'menuItem:copyUrl', // 复制链接
        'menuItem:originPage',
        'menuItem:openWithQQBrowser',
        'menuItem:openWithSafari'
      ],
      success: function (res) {
        //console.log('hideMenuItems ok');
      },
      fail: function (res) {
        //console.log('hideMenuItems failed:', JSON.stringify(res));
      }
    });

  });

  wx.error(function(res){
    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，
    // 也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
    console.log('wx.error: ', res);
  });

  //maybe can be improved as below article
  //http://theflyingdeveloper.com/controller-specific-assets-with-rails-4/
  var ready = function() {
    var cfg = $('#cfg');
    wx.config({
      debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
      appId: cfg.attr('data-appid'), // 必填，公众号的唯一标识
      timestamp: cfg.attr('data-timestamp'), // 必填，生成签名的时间戳
      nonceStr: cfg.attr('data-noncestr'), // 必填，生成签名的随机串
      signature: cfg.attr('data-signature'),// 必填，签名，见附录1
      jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });
  }

  $(document).ready(ready);
  $(document).on('page:load', ready);
});
