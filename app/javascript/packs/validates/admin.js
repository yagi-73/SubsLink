$(document).on('turbolinks:load', function() {
  $(function () {
    $("#adminLoginForm").validate({
      rules: {
        "admin[email]": {
          required: true,
          email: true
        },
        "admin[password]": {
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