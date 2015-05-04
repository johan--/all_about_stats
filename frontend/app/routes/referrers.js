import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    var dateObjects = [];

    return Ember.$.getJSON('/api/v1/top_referrers', function(dates) {
      dates.forEach(function(data) {
        dates.pushObject(App.Date.createRecord(data));
      });
    });
    return dateObjects;
  }
});
