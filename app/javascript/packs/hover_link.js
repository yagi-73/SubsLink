$(document).on("turbolinks:load", function() {
  $(".btn-hover").hover(
    function() {
      $(this).addClass("btn-light");
    },
    function() {
      $(this).removeClass("btn-light");
    }
  );
});