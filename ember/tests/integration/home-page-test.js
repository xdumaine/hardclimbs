import startApp from 'hardclimbs/tests/helpers/start-app';
import Ember from 'ember';

var App;

module('Integration - Home Page', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
  }
});

test('Should have a navbar', function() {
  visit('/').then(function() {
    equal($('.navbar').length, 1);
  });
});

test('Should allow navigating back to root from another page', function() {
  visit('/about').then(function() {
    click('a:contains("HardClimbs.info")').then(function() {
      notEqual(find('h3').text(), 'About');
    });
  });
});
