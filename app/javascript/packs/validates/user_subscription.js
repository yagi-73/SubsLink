$(document).on('turbolinks:load', function() {
  $(function () {
    $(".subscription-form").each(function() {
      $(this).validate({
        rules: {
          "user_subscription[name]": {
            required: true
          },
          "user_subscription[price]": {
            required: true
          },
          "user_subscription[contract_day]": {
            required: true
          },
          "user_subscription[update_cycle]": {
            required: true
          },
        },

        errorClass: "is-invalid",
        validClass: "is-valid",
      });
    });
  });
});