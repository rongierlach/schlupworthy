$(document).ready(function () {
  $("#spinner").hide();
  $('#schlup-button').click( function(event) {
    event.preventDefault();
    $("#spinner").show();
    $('#schlup-text').text('');
    $.post( '/', function(schlup_text) {
        console.log(schlup_text);
        $("#spinner").hide();
        $('#schlup-text').text(schlup_text).hide().fadeIn(750);
    });
  });
});
