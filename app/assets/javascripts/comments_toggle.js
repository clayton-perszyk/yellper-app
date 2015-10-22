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

  // TODO: Trigger click event to drop comments down
  // $('.new_comment').on('submit', function(){
  //   $comments = $('.comments');
  //   $comments.toggle('click', function(){
  //     $comments.css('display', 'block');
  //     $('#show-comments').text("Hide Comments");
  //   });
  // });
});
