$ ->
  $('.news_labels').on 'click', (e)->
    e.preventDefault();
    label = $(@).attr('data');
    $('#news_label').val(label);
    $('form.edit_news').submit();

  $('#disable').on 'click', (e)->
    e.preventDefault();
    $('#news_disable').val(true);
    $('form.edit_news').submit();
