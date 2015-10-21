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

  $('#edit-comment').on('click', function(e) {
    e.preventDefault();
    $('.edit').toggle('fast', function () {
      var display = $('.edit').css('display');
      if (display == 'none') {
        $('#edit-comment').text("Edit Comment")
      } else {
        $('#edit-comment').text("Cancel")
      }
    });
  });

  // $('.new_comment').on('submit', function(){
  //   $comments = $('.comments');
  //   $comments.toggle('click', function(){
  //     $comments.css('display', 'block');
  //     $('#show-comments').text("Hide Comments");
  //   });
  // });
});
