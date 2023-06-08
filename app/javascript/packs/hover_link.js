$(document).on("turbolinks:load", function() {
  $(".btn-hover").hover(
    function() {
      $(this).addClass("btn-gray");
    },
    function() {
      $(this).removeClass("btn-gray");
    }
  );
  $(".user").on('click', function() {
    window.location = $(this).data("href");
  });
});