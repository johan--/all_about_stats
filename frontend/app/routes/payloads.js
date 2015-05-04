import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    var payloadObjects = [];

    return Ember.$.getJSON('/api/v1/payloads', function(payloads) {
      payloads.forEach(function(data) {
        payloadObjects.pushObject(App.Payload.createRecord(data));
      });
    });
    return payloadObjects;
  }
});
