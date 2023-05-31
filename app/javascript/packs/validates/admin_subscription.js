$(document).on('turbolinks:load', function() {
  $(function () {
    $(".admin-subscription-form").each(function() {
      $(this).validate({
        rules: {
          "admin_subscription[name]": {
            required: true,
            rangelength: [2, 30]
          },
          "admin_subscription[image]": {
            accept: "image/*"
          },
          "admin_subscription[company_id]": {
            required: true,
            digits: true
          },
          "admin_subscription[catch_copy]": {
            maxlength: 50
          },
          "admin_subscription[description]": {
            maxlength: 500
          },
          "admin_subscription[price]": {
            required: true,
            digits: true,
            maxlength: 10
          },
          "admin_subscription[update_cycle]": {
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