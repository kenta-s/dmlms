$ ->
  $('input[name="news[label]"]:radio').on 'change', ()->
    $('form.edit_news').submit();
