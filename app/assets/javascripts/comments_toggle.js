$(document).ready(function(){
  $('#show-comments').on('click', function(e){
    e.preventDefault();
    $('.comments').toggle('slow', function(){
      var display = $('.comments').css('display');
      if (display == 'none') {
        $('#show-comments').text("Show Comments");
      } else {
        $('#show-comments').text("Hide Comments");
      }
    });
  });

  $('.edit-comment').on('click', function(e) {
    e.preventDefault();
    var self = this
    $(this).parent().children('.edit').toggle('fast', function () {
      var display = $(self).css('display');
      console.log(this)
      if ($(self).text() == 'Cancel') {
        $('.original-comment').show();
        $(self).text("Edit Comment");
      } else {
        $('.original-comment').hide();
        $(self).text("Cancel");
      }
    });
  });
});
