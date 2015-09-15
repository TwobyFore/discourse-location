import PreferencesController from 'discourse/controllers/preferences';

export default {
  name: "relate-location",

  initialize: function(container) {

    PreferencesController.reopen({
      userFields: function() {
        let siteUserFields = this.site.get('user_fields');
        if (!Ember.isEmpty(siteUserFields)) {
          const userFields = this.get('model.user_fields');

          // Staff can edit fields that are not `editable`
          if (!this.get('currentUser.staff')) {
            siteUserFields = siteUserFields.filterProperty('editable', true);
          }
          return siteUserFields.sortBy('position').map(function(field) {
            const value = userFields ? userFields[field.get('id').toString()] : null;
            return Ember.Object.create({ value, field });
          });
        }
      }.property('model.user_fields.@each.value'),
    });

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
