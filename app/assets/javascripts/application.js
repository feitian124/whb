// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require foundation
//= require fullpage.js/jquery.fullPage.js
//= require_tree .
$(function() {
  $(document).foundation();

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
  }

  $(document).ready(ready);
  $(document).on('page:load', ready);
});

