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
  }

  $(document).ready(ready);
  $(document).on('page:load', ready);
});
