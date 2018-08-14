$(document).on('turbolinks:load', function() {
  var form = $('form.new_note');

  if (form.length > 0) {
    var checkBox = $('#note_general');
    var general = checkBox.prop('checked');
    form.find('.hidden-if-general').toggle(!general);

    checkBox.on('change', function(){
      var general = checkBox.prop('checked');
      form.find('.hidden-if-general').toggle(!general);
    });
  }
});
