//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require fullpage.js/jquery.fullPage.js
//= require_self

$(function() {
  /**
   * 播放或者暂停背景音乐
   */
  var toggleMusic = function(play) {
    var audio = document.getElementById("audio");
    var icon = $("#music-icon");
    if(play === undefined) {
      if(audio.paused){
        icon.addClass("play");
        audio.play();
      } else {
        icon.removeClass("play");
        audio.pause();
      }
    } else if(play === true) {
      icon.addClass("play");
      audio.play();
    } else {
      icon.removeClass("play");
      audio.pause();
    }
  }

  /**
   * 当有 menu 参数时, 展开该菜单
   * 当没有 menu 参数时, 收起当前菜单
   */
  var toggleMenu = function(menu) {
    if(menu) {
      var content = $('.listWrapper').find('.' + menu.attr("id"));
      content.removeClass('hide');
      content.siblings().addClass('hide');
      $('.select-layer > .title-bar > .title').text(menu.attr('data-title'));
      $('.select-layer').addClass('showSelect');
    } else {
      $('.select-layer').removeClass('showSelect');
      $('.listWrapper').children().addClass('hide');
      toggleListen();
    }
  }

  /**
   * 当有 row 参数时, 试听歌曲 row 行的歌曲
   * 当没有 row 参数时, 停止当前试听
   */
  var indicator, pick;
  var toggleListen = function(row) {
      createjs.Sound.removeAllSounds();
      $('.music').find(".indicator").removeClass("playing loading");
      $('.music').find(".pick").removeClass('show');
      if(row) {
        var src = row.attr("data-song-src");
        indicator = row.find(".indicator");
        pick = row.find(".pick");
        createjs.Sound.registerSound(src, "sound");
        indicator.addClass("loading");
        createjs.Sound.on("fileload", function(e){
          createjs.Sound.play("sound");
          indicator.removeClass("loading").addClass("playing");
          pick.addClass("show");
        });
      }
  }

  wx.ready(function(){
    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，
    // 所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。
    // 对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
    console.log('wx.ready');
    // 分享给朋友圈
    wx.onMenuShareTimeline({
      title: 'TOP科技',
      link: 'http://www.getxrp.com/albums/1',
      imgUrl: 'http://img3.douban.com/view/movie_poster_cover/spst/public/p2166127561.jpg',
      trigger: function (res) {
        alert('用户点击分享到朋友圈');
      },
      success: function (res) {
        alert('已分享');
      },
      cancel: function (res) {
        alert('已取消');
      },
      fail: function (res) {
        alert('失败:'+JSON.stringify(res));
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
        // 用户确认分享后执行的回调函数
        console.log('onMenuShareAppMessage success');
      },
      cancel: function () {
        // 用户取消分享后执行的回调函数
        console.log('onMenuShareAppMessage cancel');
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
    if($('#fullpage').length){
      $('#fullpage').fullpage();
    }

    $('.menus > .menu > a').on('click',function(e){
        e.stopPropagation();
        toggleMenu($(this));
        toggleMusic(false);
    });

    $('.select-layer .cancel').on('click',function(e){
      e.stopPropagation();
      toggleMenu();
    });

    $("#music-icon").on('click', function(e){
      e.stopPropagation();
      toggleMusic();
    });

    $(".listWrapper > .music > .row").on('click', function(e){
      e.stopPropagation();
      toggleListen($(this));
    });

    $(".listWrapper > .music .pick").on('click', function(e){
      e.stopPropagation();
      var albumId = $("#albumId").val();
      var songId = $(this).parents(".row").attr("data-song-id");
      var songSrc = $(this).parents(".row").attr("data-song-src");
      $.ajax({
        type: 'put',
        url: '/albums/' + albumId,
        data: {
          album: {
            song_id: songId
          }
        },
        dataType : 'json',
        success : function(data) {
          $("#audio").attr("src", songSrc);
          toggleMenu();
          toggleMusic(true);
        }
      });
    });

    $(".delPhoto").on('click', function(e){
      e.stopPropagation();
      var imgId = $(this).siblings("img").attr("data-id");
      var _this = this;
      if(confirm("确认删除这张照片吗？")) {
        $.ajax({
          type: 'delete',
          url: '/images/' + imgId,
          dataType : 'json',
          success : function(data) {
            $(_this).parent().hide();
          }
        });
      }
    });

    $(".modify-title").on('click',function(){
        alert($(".title-content").val());
        //标题保存到数据库中
    });

    var cfg = $('#cfg');
    wx.config({
      debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
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
