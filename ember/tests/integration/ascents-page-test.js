import startApp from 'hardclimbs/tests/helpers/start-app';
import Ember from 'ember';

var App;

module('Integration - Ascent Page', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
    //server.shutdown();
  }
});

test('Should allow navigation to the ascents page from the landing page', function() {
  visit('/').then(function() {
    click('a:contains("Ascents")').then(function() {
      equal(find('h1').text(), 'Ascents');
    });
  });
});

test('Should list all ascents', function() {
  visit('/ascent').then(function() {
    //equal(find('a:contains("Bugs Bunny")').length, 1);
  });
});

test('Should be able to navigate to a ascents page', function() {
  visit('/ascents').then(function() {
    //click('a:contains("Bugs Bunny")').then(function() {
    //  equal(find('h4').text(), 'Bugs Bunny');
    //});
  });
});

test('Should be able to visit a ascent page', function() {
  visit('/ascents/1').then(function() {
  //  equal(find('h1').text(), 'Bugs Bunny');
  });
});
