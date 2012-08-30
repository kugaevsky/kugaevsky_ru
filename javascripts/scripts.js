(function() {

  $(function() {
    $('.fame-toggler .btn').click(function() {
      if ($(this).val() === '0') {
        $('.hall-of-fame').removeClass('in');
      }
      if ($(this).val() === '1') {
        return $('.hall-of-fame').addClass('in');
      }
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
