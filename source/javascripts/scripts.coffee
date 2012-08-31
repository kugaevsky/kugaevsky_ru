$ ->
  $('.fame-toggler .btn').click ->
    $('.hall-of-fame').removeClass('in') if $(@).val() is '0'
    $('.hall-of-fame').addClass('in') if $(@).val() is '1'

  $('#codeschool-badges').proudify
    'service': 'codeschool'
    'username': 'kugaevsky'

  $('#coderwall-badges').proudify
    'service': 'coderwall'
    'username': 'kugaevsky'

  $('#github-projects').proudify
    'service': 'github'
    'username': 'kugaevsky'
