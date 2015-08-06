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

  var showMusicCategory = function(category) {
      if ( category == 'love') {
        $('.music .music-category').addClass('hide');
        $('.music .music-category-love').removeClass('hide');
      } else if(category == 'fashion') {
        $('.music .music-category').addClass('hide');
        $('.music .music-category-fashion').removeClass('hide');
      } else if(category == 'pure') {
        $('.music .music-category').addClass('hide');
        $('.music .music-category-pure').removeClass('hide');
      } else {
        $('.music .music-category').addClass('hide');
        $('.music .music-category-all').removeClass('hide');
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

    $(".listWrapper .music .music-all").on('click', function(e){
      e.stopPropagation();
      showMusicCategory('all');
    });

    $(".listWrapper .music .music-love").on('click', function(e){
      e.stopPropagation();
      showMusicCategory('love');
    });

    $(".listWrapper .music .music-fashion").on('click', function(e){
      e.stopPropagation();
      showMusicCategory('fashion');
    });

    $(".listWrapper .music .music-pure").on('click', function(e){
      e.stopPropagation();
      showMusicCategory('pure');
    });

    $(".listWrapper .music .row").on('click', function(e){
      e.stopPropagation();
      toggleListen($(this));
    });

    $(".listWrapper .music .pick").on('click', function(e){
      e.stopPropagation();
      var albumId = $("#albumId").val();
      var songId = $(this).parents(".row").attr("data-song-id");
      var songSrc = $(this).parents(".row").attr("data-song-src");
      var openid = $("#openid").val();
      $.ajax({
        type: 'put',
        url: '/albums/' + albumId,
        data: {
          album: {
            song_id: songId
          },
          openid: openid
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
      var openid = $("#openid").val();
      if(confirm("确认删除这张照片吗？")) {
        $.ajax({
          type: 'delete',
          url: '/images/' + imgId,
          data: {
            openid: openid
          },
          dataType : 'json',
          success : function(data) {
            $(_this).parent().hide();
          }
        });
      }
    });
  }

  $(document).ready(ready);
  $(document).on('page:load', ready);
});
