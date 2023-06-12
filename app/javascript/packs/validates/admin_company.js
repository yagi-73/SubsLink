$(document).on('turbolinks:load', function() {
  $(function () {
    $("#companyNewForm, #companyEditForm").validate({
      rules: {
        "admin_company[name]": {
          required: true,
          rangelength: [2, 30]
        },
        "admin_company[image]": {
          accept: "image/*"
        }
      },

      errorClass: "is-invalid",
      validClass: "is-valid",
    });
  });
});