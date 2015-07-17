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
        var layer = $('.select-layer');
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
        layer.find('.title').text(title);
        layer.addClass('showSelect');
    });

    $('.select-layer .cancel').on('click',function(e){
      e.stopPropagation();
      $('.select-layer').removeClass('showSelect');
    });

    $(".music-trigger").click(function(document){
      if($(this).hasClass("play")){
        $('#pause-btn').click();
        $(this).removeClass("play icon-rotate").addClass("pause");
      } else {
        $('#play-btn').click();
        $(this).removeClass("pause").addClass("play icon-rotate");
      }
    });
  }

  $(document).ready(ready);
  $(document).on('page:load', ready);
});

