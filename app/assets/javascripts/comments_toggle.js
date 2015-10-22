$(document).ready(function(){
  $('#show-comments').on('click', function(e){
    e.preventDefault();
    $('.comments').toggle('slow', function(){
      var display = $('.comments').css('display');
      console.log(display);
      if (display == 'none') {
        $('#show-comments').text("Show Comments");
      } else {
        $('#show-comments').text("Hide Comments");
      }
    });
  });

  $('.edit-comment').on('click', function(e) {
    e.preventDefault();
    var $self = $(this);
    $(this).parent().find('.edit').toggle('fast', function () {
      var display = $self.css('display');
      console.log(this);
      if ($self.text() == 'Cancel') {
        $self.find('.original-comment').show();
        $self.text("Edit Comment");
      } else {
        $self.find('.original-comment').hide();
        $self.text("Cancel");
      }
    });
  });
});
