$(document).on('turbolinks:load', function() {
  $(function () {
    $(".subscription-form").each(function() {
      $(this).validate({
        rules: {
          "user_subscription[name]": {
            required: true,
            rangelength: [2, 30]
          },
          "user_subscription[price]": {
            required: true,
            digits: true,
            maxlength: 10
          },
          "user_subscription[contract_day]": {
            required: true,
            date: true
          },
          "user_subscription[update_cycle]": {
            required: true,
            range: [1, 12]
          },
        },

        errorClass: "is-invalid",
        validClass: "is-valid",
      });
    });
  });
});