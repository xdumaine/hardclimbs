import startApp from 'hardclimbs/tests/helpers/start-app';
import Ember from 'ember';
import { test, moduleForModel } from 'ember-qunit';
import Climber from 'hardclimbs/models/climber';
import Ascent from 'hardclimbs/models/ascent';

moduleForModel('climber', 'Climber', {
  // Specify the other units that are required for this test.
 needs: ['model:ascent']
});

test('it exists', function() {
  var model = this.subject();
  //var store = this.store();
  ok(model);
});

// test('ascent relationship', function() {
//   //debugger;
//   var relationships = Ember.get(Climber, 'relationships');
//   deepEqual(relationships.get(Ascent), [
//     { name: 'ascents', kind: 'hasMany' }
//   ]);
// });
