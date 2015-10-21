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
    $('.edit').toggle('fast', function () {
      var display = $(this).css('display');
      if (display == 'none') {
        $('.original-comment').show();
        $('.edit-comment').text("Edit Comment");
      } else {
        $('.original-comment').hide();
        $('.edit-comment').text("Cancel");
      }
    });
  });
});
