# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('.btn-reply').click ->
    $('#form-reply_' + @id.split('_').pop()).toggle()

  $('.comment-textfield').focusin ->
    $('.btn-comment-submit').prop('disabled', true).show()
    $('.btn-comment-submit').prop('disabled', false) if $(this).val() isnt ''
    $(this).keyup ->
      $('.btn-comment-submit').prop('disabled', false) if $(this).val() isnt ''
      $('.btn-comment-submit').prop('disabled', true) if $(this).val() is ''

  $('.reply-textfield').focusin ->
    $('#btn-reply-submit_' + @id.split('_').pop()).prop('disabled', true).show()
    $('#btn-reply-submit_' + @id.split('_').pop()).prop('disabled', false) if $(this).val() isnt ''
    $(this).keyup ->
      $('#btn-reply-submit_' + @id.split('_').pop()).prop('disabled', false) if $(this).val() isnt ''
      $('#btn-reply-submit_' + @id.split('_').pop()).prop('disabled', true) if $(this).val() is ''


$ ->
  $('[data-toggle="tooltip"]').tooltip()
  return
