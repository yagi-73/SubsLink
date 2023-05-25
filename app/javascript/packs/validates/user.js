$(document).on('turbolinks:load', function() {
  $(function () {
    $("#signupForm, #loginForm").validate({
      rules: {
        "user[name]": {
          required: true
        },
        "user[email]": {
          required: true
        },
        "user[password]": {
          required: true
        },
        "user[password_confirmation]": {
          required: true,
          equalTo: "#inputPassword"
        },
      },

      messages: {
        "user[password_confirmation]": {
          equalTo: "パスワードが一致していません"
        },
      },
      errorClass: "is-invalid",
      validClass: "is-valid",
    });

    // $("#inputName, #inputEmail, #inputPassword, #inputPasswordConfirmation").blur(function () {
    //   $(this).valid();
    // });
  });
});