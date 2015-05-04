import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

export default Router.map(function() {
  this.resource('urls', { path: '/urls'});
  this.resource('referrers', { path: '/referrers' });
  this.resource('payloads', { path: '/payloads' })
});
