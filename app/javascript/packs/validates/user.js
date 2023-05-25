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

      errorPlacement: function(error, element){
        if(element.attr('data-toggle')=='password'){
          element.parents(".form-group").append(error)
        } else{
          error.insertAfter(element)
        }
      },
      errorClass: "is-invalid",
      validClass: "is-valid",
    });

    // $("#inputName, #inputEmail, #inputPassword, #inputPasswordConfirmation").blur(function () {
    //   $(this).valid();
    // });
  });
});