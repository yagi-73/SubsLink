$(document).on('turbolinks:load', function() {
  $(function () {
    $("#subscribeNewForm").validate({
      rules: {
        "subscribe[contract_day]": {
          required: true,
          date: true
        }
      },

      errorClass: "is-invalid",
      validClass: "is-valid",
    });
  });
});