import startApp from 'hardclimbs/tests/helpers/start-app';
import Ember from 'ember';

var App;

module('Integration - Climber Page', {
  setup: function() {
    App = startApp();
    // var speakers = [
    //   {
    //     id: 1,
    //     name: 'Bugs Bunny'
    //   },
    //   {
    //     id: 2,
    //     name: 'Wile E. Coyote'
    //   },
    //   {
    //     id: 3,
    //     name: 'Yosemite Sam'
    //   }
    // ];
    //
    // server = new Pretender(function() {
    //   this.get('/api/speakers', function(request) {
    //     return [200, {"Content-Type": "application/json"}, JSON.stringify({speakers: speakers})];
    //   });
    //
    //   this.get('/api/speakers/:id', function(request) {
    //     var speaker = speakers.find(function(speaker) {
    //       if (speaker.id === parseInt(request.params.id, 10)) {
    //         return speaker;
    //       }
    //     });
    //
    //     return [200, {"Content-Type": "application/json"}, JSON.stringify({speaker: speaker})];
    //   });
    // });

  },
  teardown: function() {
    Ember.run(App, 'destroy');
    //server.shutdown();
  }
});

test('Should allow navigation to the climbers page from the landing page', function() {
  visit('/').then(function() {
    click('a:contains("Climbers")').then(function() {
      equal(find('h1').text(), 'Climbers');
    });
  });
});

test('Should list all climbers', function() {
  visit('/climbers').then(function() {
    //equal(find('a:contains("Bugs Bunny")').length, 1);
  });
});

test('Should be able to navigate to a climbers page', function() {
  visit('/climbers').then(function() {
    //click('a:contains("Bugs Bunny")').then(function() {
    //  equal(find('h4').text(), 'Bugs Bunny');
    //});
  });
});

test('Should be able to visit a climber page', function() {
  visit('/climbers/1').then(function() {
  //  equal(find('h1').text(), 'Bugs Bunny');
  });
});
