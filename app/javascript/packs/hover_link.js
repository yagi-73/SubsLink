$(document).on("turbolinks:load", function() {
  $(".btn-hover").hover(
    function() {
      $(this).addClass("btn-light");
    },
    function() {
      $(this).removeClass("btn-light");
    }
  );
  $(".user").on('click', function() {
    window.location = $(this).data("href");
  });
});