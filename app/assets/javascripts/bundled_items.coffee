# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.qtn_field').on 'keyup', ->
    $row = $(this).closest('tr')
    qtn = $(this).val()*1.0
    price = parseFloat($row.find('.price').eq(0).text().split('$')[1])
    $row.find('.item_total').eq(0).text('$' + (price * qtn).toFixed(2))
