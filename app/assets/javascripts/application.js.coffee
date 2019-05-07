#= require jquery
#= require bootstrap-sprockets

$ ->
  $('#test-3-table tr').click ->
    $(@).addClass('highlighted')

  $('#test-4-ajax-btn').click ->
    $.post '/pages/test_4', { trigger: 'ajax-call' }, (data) ->
      $('#ajax-result').text data.response_text
