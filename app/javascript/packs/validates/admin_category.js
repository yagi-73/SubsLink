$(document).on('turbolinks:load', function() {
  $(function () {
    $("#categoryNewForm, #categoryEditForm").validate({
      rules: {
        "admin_category[name]": {
          required: true,
          rangelength: [2, 10]
        },
        "admin_category[icon]": {
          required: true,
          rangelength: [2, 20]
        }
      },

      errorClass: "is-invalid",
      validClass: "is-valid",
    });
  });
});