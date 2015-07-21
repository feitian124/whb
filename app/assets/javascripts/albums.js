$(function() {

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

  //maybe can be improved as below article
  //http://theflyingdeveloper.com/controller-specific-assets-with-rails-4/
  var ready = function() {
    if($('#fullpage').length){
      $('#fullpage').fullpage();
    }

    // 显示选中的菜单页面, 其余的隐藏
    $('.menus > .menu > a').on('click',function(e){
        e.stopPropagation();
        var id = $(this).attr('id');
        var title = $(this).attr('data-title');
        $('.select-layer > .title-bar > .title').text(title);
        $('.listWrapper').children().addClass('hide');
        $('.listWrapper').children('.'+id).removeClass('hide');
        $('.select-layer').addClass('showSelect');
        toggleMusic(false);
    });

    $('.select-layer .cancel').on('click',function(e){
      e.stopPropagation();
      $('.select-layer').removeClass('showSelect');
      createjs.Sound.removeAllSounds();
      $('.music').find(".indicator").removeClass().addClass('indicator');
      $('.music').find(".pick").removeClass('show');
    });

    $("#music-icon").on('click', function(e){
      e.stopPropagation();
      toggleMusic();
    });

    var indicator;
    var pick;
    $(".listWrapper > .music > .row").on('click', function(e){
      e.stopPropagation();
      createjs.Sound.removeAllSounds();
      var src = $(this).attr("data-song-src");
      indicator = $(this).find(".indicator");
      pick = $(this).find(".pick");
      $(this).parents('.music').find(".indicator").removeClass().addClass('indicator');
      $(this).parents('.music').find(".pick").removeClass('show');
      createjs.Sound.registerSound(src, "sound");
      indicator.addClass("loading");
      createjs.Sound.on("fileload", function(e){
        createjs.Sound.play("sound");
        indicator.removeClass("loading").addClass("playing");
        pick.addClass("show");
      });
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
          document.getElementById("audio").pause();
        }
      });
    });


    //createjs.Sound.registerSound("/musics/shenshi.m4a", "");
  }

  $(document).ready(ready);
  $(document).on('page:load', ready);
});
