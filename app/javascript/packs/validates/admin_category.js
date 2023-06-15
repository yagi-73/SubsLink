$(document).on('turbolinks:load', function() {
  $(function () {
    $("#categoryNewForm, #categoryEditForm").validate({
      rules: {
        "category[name]": {
          required: true,
          rangelength: [2, 10]
        },
        "category[icon]": {
          required: true,
          rangelength: [2, 20]
        }
      },

      errorClass: "is-invalid",
      validClass: "is-valid",
    });
  });
});