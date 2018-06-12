# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#form-cover').on 'change', (event) ->
    files = event.target.files
    image = files[0]
    # here's the file size
    console.log image.size
    reader = new FileReader

    reader.onload = (file) ->
      img = new Image(300, 300)
      console.log file
      img.src = file.target.result
      img.className += "rounded img-fluid"
      $('#form-preview').html img
      return

    reader.readAsDataURL image
    console.log files
    return

  $('.btn-vote-filter').onclick ->
    $(this).addClass('active')
    return

$(document).ready ->
  $('.btn-need').click ->
    $('.btn-nevermind').toggle()

    return
  return