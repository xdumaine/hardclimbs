import Ember from 'ember';

var Router = Ember.Router.extend({
  location: HardclimbsENV.locationType
});

Router.map(function() {
  this.route('about');
  this.route('contact');

  this.resource('climbers', function() {
    this.route('show', { path: ':slug' });
  });

  this.resource('ascents', function() {
    this.route('show', { path: ':slug' });
  });

});

export default Router;
