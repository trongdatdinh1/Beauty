$(document).on('turbolinks:load', function() {
  $('#rating-form').raty({
    path: '/assets/',
    scoreName: 'review[star]',
  });

  $('.review-rating').raty({
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    },
    path: '/assets/'
  });

  $('.average-review-rating').raty({
    readOnly: true,
    path: '/assets/',
    score: function() {
      return $(this).attr('data-score');
    }
  });
});
