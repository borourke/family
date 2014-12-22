var ready;
ready = function() {

  $('#btn-new-thread').click(function () {
    $('.new-thread').show();
    $('.thread-messages').hide();
    $('.messages').addClass('well');
  });

  // $('#new_threads').submit(function() {  
  //   var valuesToSubmit = $(this).serialize();
  //   $.ajax({
  //       type: "POST",
  //       url: "/threads", //sumbits it to the given url of the form
  //       data: valuesToSubmit,
  //       dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
  //   }).success(function(json){
  //       alert("Hi there.")
  //   });
  //   return false; // prevents normal behaviour
  // });

  // Show and hide messages and corresponding threads
  $(".thread-row").each(function () {
    $(this).click(function () {
      threadId = $(this).attr('id').substring(7);
      $('.thread-messages').show();
      $('.new-thread').hide();
      $('.message-table').hide();
      $('#message-thread-'+threadId).css('display', 'inline');
      $('.messages').removeClass('well');
    });
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);