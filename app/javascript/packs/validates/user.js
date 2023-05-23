$(function () {
  $("#signup-form").validate({
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
        equalTo: "#password"
      },
    },

    messages: {
      "user[password]": {
        required: "パスワードを入力してください"
      },
      "user[password_confirmation]": {
        required: "確認用パスワードを入力してください",
        equalTo: "パスワードが一致していません"
      },
    },
    errorClass: "is-invalid",
    validClass: "is-valid",
    errorElement: "p"
  });

  $("#password, #password_confirmation").blur(function () {
    $(this).valid();
  });
});