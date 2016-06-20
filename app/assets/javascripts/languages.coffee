# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # TODO: use env
  socket = io.connect("http://localhost:3001", {force_connection: true})

  socket.on('language', (data) ->
    console.log(data)
  )

  $('body').on('ajax:success', 'form', (e, data, status, xhr) ->
    console.log(data)
    el = '<ul class="list-unstyled">'
    for k, v of data
      el += "<li>#{v.name}: #{v.votes}</li>"
      console.log(v.name, v.votes)

    el += '</ul>'

    $('#voting_result').html(el)
  )
