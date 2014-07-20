import startApp from 'hardclimbs/tests/helpers/start-app';
import Ember from 'ember';
import { test, moduleForModel } from 'ember-qunit';
import Climb from 'hardclimbs/models/climb';
import Style from 'hardclimbs/models/style';

moduleForModel('climb', 'Climb', {
  // Specify the other units that are required for this test.
  needs: ['model:style', 'model:area', 'model:grade', 'model:ascent']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(model);
});

// test('style relationship', function() {
//   var relationships = Ember.get(Climb, 'relationships');
//   deepEqual(relationships.get(Style), [
//     { name: 'style', kind: 'hasOne' }
//   ]);
// });
