import Ember from 'ember';

export default Ember.Controller.extend({

  dates: function () {
    const model = this.get('model');
    return Object.keys(model).reduce((array, date) => {
      array.push({
        date: date,
        urls: model[date]
      });
      return array;
    }, [])
  }.property('model')

});
