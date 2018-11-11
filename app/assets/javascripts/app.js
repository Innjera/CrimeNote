
// Load select Flags
$(document).on('turbolinks:load', function formatState (state) {
  if (!state.id) {
    return state.text;
  }
  var baseUrl = "images/flags";
  var $state = $(
    '<span><img src="' + baseUrl + '/' + state.element.value.toLowerCase() + '.png" class="img-flag" /> ' + state.text + '</span>'
  );
  return $state;
};
  $("select").select2({
    placeholder: 'choose a country',
    width: '100%',
    templateResult: formatState,
  }).on('change',function(){
    var countryCode = this.value
      console.log(countryCode);
      // Use the coutry code to switch to the selected country
  });
); 
