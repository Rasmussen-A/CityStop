# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$( ->
  $('.delete-action').click ->
    id = $(this).data('id')
    $("#confirm-btn").html(
      '<a data-method="delete" rel="nofollow" href="/itineraries/' + id + '">Да</a>')
)
