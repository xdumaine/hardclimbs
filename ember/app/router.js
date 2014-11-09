import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
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

  this.resource('climbs', function() {
    this.route('show', { path: ':slug' });
  });

  this.resource('areas', function() {
    this.route('show', { path: ':slug' });
  });

  this.resource('Grade', { path: 'Grades/:Grade_id' });
  this.resource('Style', { path: 'Styles/:Style_id' });
});

export default Router;
