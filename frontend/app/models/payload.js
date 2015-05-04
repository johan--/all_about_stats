import DS from 'ember-data';

export default DS.Model.extend({
  url: DS.attr('string'),
  referrer: DS.attr('string'),
  created_at: DS.attr('date')
});
