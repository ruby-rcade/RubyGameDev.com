$ ->
  $('form#new_comment').hide()
  $('#add_comment').click (e)->
    e.preventDefault()
    $(@).hide()
    $('form#new_comment').show()