$(document).on('turbolinks:load', function() {
  $(function () {
    $('.tab').click(function(){
      $('.tab-active').removeClass('tab-active');
      $(this).addClass('tab-active');
      $('.box-show').removeClass('box-show');
      const index = $(this).index();
      $('.tabbox').eq(index).addClass('box-show');
    });
  });

  var hash = window.location.hash;
  if (hash === "#followings") {
    $('#followings-tab').trigger('click');
  } else if (hash === "#followers") {
    $('#follower-tab').trigger('click');
  } else if (hash == "#subscriptions") {
    $('.tab-active').removeClass('tab-active');
    $('.subscriptions-tab').addClass('tab-active');
    $('.box-show').removeClass('box-show');
    const index = $('subscriptions-tab').index();
    $('.tabbox').eq(index).addClass('box-show');
  }
});