$(document).on('turbolinks:load', function() {
  $(function () {
    $("#adminLoginForm").validate({
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
        }
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
  });
});