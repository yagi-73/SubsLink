$(document).on('turbolinks:load', function() {
  $(function () {
    $("#userSignupForm, #userLoginForm").validate({
      rules: {
        "user[name]": {
          required: true,
          rangelength: [2, 10]
        },
        "user[email]": {
          required: true,
          email: true
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

  $(function () {
    $("#userEditForm").validate({
      rules: {
        "user[name]": {
          required: true,
          rangelength: [2, 10]
        },
        "user[introduction]": {
          maxlength: 100
        },
        "user[image]": {
          accept: "image/*"
        }
      },

      messages: {
        "user[image]": {
          accept: "画像をアップロードしてください"
        }
      },

      errorClass: "is-invalid",
      validClass: "is-valid",
    });
  });
});