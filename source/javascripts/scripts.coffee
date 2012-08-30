$ ->
  $('.fame-toggler .btn').click ->
    $('.hall-of-fame').removeClass('in') if $(@).val() is '0'
    $('.hall-of-fame').addClass('in') if $(@).val() is '1'
