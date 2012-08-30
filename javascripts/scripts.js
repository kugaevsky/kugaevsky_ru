(function() {

  $(function() {
    return $('.fame-toggler .btn').click(function() {
      if ($(this).val() === '0') {
        $('.hall-of-fame').removeClass('in');
      }
      if ($(this).val() === '1') {
        return $('.hall-of-fame').addClass('in');
      }
    });
  });

}).call(this);
