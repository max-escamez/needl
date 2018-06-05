# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.btn-reply').click ->
    $('#form-reply_'+@id.split('_').pop()).toggle()
    return
  return


$ ->
  $('[data-toggle="tooltip"]').tooltip()
  return
