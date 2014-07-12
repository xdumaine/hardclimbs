import startApp from 'hardclimbs/tests/helpers/start-app';
import Ember from 'ember';

var App;

module('Integration - Contact Page', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
  }
});

test('Should navigate to the Contact page', function() {
  visit('/').then(function() {
    click("a:contains('Contact')").then(function() {
      equal(find('h1').text(), 'Contact');
    });
  });
});
