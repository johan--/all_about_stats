import Ember from 'ember';

export default Ember.Component.extend({
  downArrow: '&#9660',
  upArrow: '&#9650',

  tagName: 'th',

  actions: {
    sortBy: function(sortProperty, ascending){
      this.sendAction('action', sortProperty, ascending);
    }
  }
});
