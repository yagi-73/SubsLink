$(document).on('turbolinks:load', function() {
  var hash = window.location.hash;
  if (hash === "#followings") {
    $('#followings-tab').trigger('click');
  } else if (hash === "#followers") {
    $('#follower-tab').trigger('click');
  }
  $(function() {
    $('.tab').click(function(){
      $('.tab-active').removeClass('tab-active');
      $(this).addClass('tab-active');
      $('.box-show').removeClass('box-show');
      const index = $(this).index();
      $('.tabbox').eq(index).addClass('box-show');
    });
  });
});