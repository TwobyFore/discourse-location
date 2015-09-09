export default {
  name: "relate-location",

  initialize: function(container) {
    $('body').on('change', 'select', function(e){
      if($(this).parent().find("p:contains('Province/State')").length > 0){
        var val = $(this).val();
        if(val != "") {
          $.ajax({
            url: '/cities_by_state',
            data: { state: val.toString() }
          }).then(function(data) {
            var combochild = $('select').parent().find("p:contains('City')").siblings('select');
            combochild.children().remove();
            combochild.append("<option value=''> (select an option) </option>");
            _.each(data.locations, function(loc) {
              combochild.append("<option value='"+loc.name + "'>" + loc.name + "</option>");
            });
            combochild.select2({formatResult: this.comboTemplate, minimumResultsForSearch: 5, width: 'resolve'});
          });
        }
      }

      if($(this).parent().find("p:contains('City')").length > 0){
        var val = $(this).val();
        if(val != "") {
          $.ajax({
            url: '/neighborhood_by_city',
            data: { city: val.toString() }
          }).then(function(data) {
            var combochild = $('select').parent().find("p:contains('Neighborhood')").siblings('select');
            combochild.children().remove();
            combochild.append("<option value=''> (select an option) </option>");
            _.each(data.locations, function(loc) {
              combochild.append("<option value='"+loc.name + "'>" + loc.name + "</option>");
            });
            combochild.select2({formatResult: this.comboTemplate, minimumResultsForSearch: 5, width: 'resolve'});
          });
        }
      }
    });
  }
}
