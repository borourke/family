var ready;
ready = function() {

  $('#btn-new-thread').click(function () {
    $('.new-thread').show();
    $('.thread-messages').hide();
    $('.messages').addClass('well');
  })

  $('#new_threads').submit(function() {
    // get all the inputs into an array.
    var inputs = $('#new_threads :input');

    // get an associative array of just the values.
    var values = {};
    inputs.each(function() {
        values[this.name] = $(this).val();
    });

    console.log(inputs);

  });

};

$(document).ready(ready);
$(document).on('page:load', ready);