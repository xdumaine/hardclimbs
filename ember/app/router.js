import Ember from 'ember';

var Router = Ember.Router.extend({
  location: HardclimbsENV.locationType
});

Router.map(function() {
  this.route('about');
  this.resource('climbers', function() {
    this.route('show', {path: ':climber_id'});
  });

});

export default Router;
