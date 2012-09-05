(function() {

  $(function() {
    $('.fame-toggler .btn').click(function() {
      if ($(this).val() === '0') {
        $('.hall-of-fame').addClass('hidden').removeClass('in');
      }
      if ($(this).val() === '1') {
        return $('.hall-of-fame').removeClass('hidden').addClass('in');
      }
    });
    $('#codeschool-badges').proudify({
      'service': 'codeschool',
      'username': 'kugaevsky'
    });
    $('#coderwall-badges').proudify({
      'service': 'coderwall',
      'username': 'kugaevsky'
    });
    return $('#github-projects').proudify({
      'service': 'github',
      'username': 'kugaevsky'
    });
  });

}).call(this);
