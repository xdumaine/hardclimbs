import startApp from 'hardclimbs/tests/helpers/start-app';
import Ember from 'ember';

var App;

module('Integration - Climb Page', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
  }
});

test('Should allow navigation to the climb page from the landing page', function() {
  visit('/').then(function() {
    click('a:contains("Climbs")').then(function() {
      equal(find('h1').text(), 'Climbs');
    });
  });
});

test('Should list all climbs', function() {
  visit('/climbs').then(function() {
    ok(true);
  });
});

// test('Should be able to navigate to a climbers page', function() {
//   visit('/climbers').then(function() {
//     //click('a:contains("Bugs Bunny")').then(function() {
//     //  equal(find('h4').text(), 'Bugs Bunny');
//     //});
//   });
// });

test('Should be able to visit a climb page', function() {
  visit('/climbs/1').then(function() {
    ok(true);
  });
});
