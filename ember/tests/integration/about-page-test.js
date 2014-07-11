import startApp from 'hardclimbs/tests/helpers/start-app';
import Ember from 'ember';

var App;

module('Integration - About Page', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
  }
});

test('Should navigate to the About page', function() {
  visit('/').then(function() {
    click("a:contains('About')").then(function() {
      equal(find('h1').text(), 'About');
    });
  });
});
