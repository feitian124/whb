$(function() {
  //maybe can be improved as below article
  //http://theflyingdeveloper.com/controller-specific-assets-with-rails-4/
  var ready = function() {
    if($('#fullpage').length){
      $('#fullpage').fullpage();
    }

    // 菜单面板
    $('.menus > .menu > a').on('click',function(e){
        e.stopPropagation();
        var id = $(this).attr('id');
        var title = '';
        switch (id){
            case 'tpl':
                title = '更换模板';
                break;
            case 'music':
                title = '更换音乐';
                break;
            case 'pics':
                title = '管理相册';
                break;
            case 'title':
                title = '修改标题';
                break;
            default :
                break;
        }
        $('.select-layer > .title-bar > .title').text(title);
        $('.listWrapper').children().addClass('hide');
        $('.listWrapper').children('.'+id).removeClass('hide');
        $('.select-layer').addClass('showSelect');
    });

    $('.select-layer .cancel').on('click',function(e){
      e.stopPropagation();
      $('.select-layer').removeClass('showSelect');
      createjs.Sound.removeAllSounds();
      $('.music').find(".indicator").removeClass().addClass('indicator');
      $('.music').find(".pick").addClass('hide');
    });

    $(".music-icon").click(function(document){
      if($(this).hasClass("play")){
        $(this).removeClass("play icon-rotate").addClass("pause");
        createjs.Sound.stop();
      } else {
        $(this).removeClass("pause").addClass("play icon-rotate");
        createjs.Sound.play("sound");
      }
    });

    var indicator;
    var pick;
    $(".listWrapper > .music > .row").on('click', function(e){
      e.stopPropagation();
      createjs.Sound.removeAllSounds();
      var src = $(this).find("input:hidden").val();
      indicator = $(this).find(".indicator");
      pick = $(this).find(".pick");
      $(this).parents('.music').find(".indicator").removeClass().addClass('indicator');
      $(this).parents('.music').find(".pick").addClass('hide');
      createjs.Sound.registerSound(src, "sound");
      indicator.addClass("loading");
      createjs.Sound.on("fileload", function(e){
        createjs.Sound.play("sound");
        indicator.removeClass("loading").addClass("playing");
        pick.removeClass("hide");
      });
    });

    //createjs.Sound.registerSound("/musics/shenshi.m4a", "");
  }

  $(document).ready(ready);
  $(document).on('page:load', ready);
});
