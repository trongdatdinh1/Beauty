$(document).on('turbolinks:load', function() {
  $('[data-toggle="tooltip"]').tooltip();
  $('.navbar a, footer a[href="#myPage"]').on('click', function(event) {
    if (this.hash !== '') {
      event.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
        window.location.hash = hash;
      });
    }
  });
});

$(document).on('click', '.toggle-window', function(e) {
  e.preventDefault();
  var panel = $(this).parent().parent();
  var messages_list = panel.find('.messages-list');

  panel.find('.panel-body').toggle();
  panel.attr('class', 'panel panel-default');

  if (panel.find('.panel-body').is(':visible')) {
    var height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
  }
});
