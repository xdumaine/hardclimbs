import { test, moduleForModel } from 'ember-qunit';

moduleForModel('ascent', 'Ascent', {
  // Specify the other units that are required for this test.
  needs: ['model:climber', 'model:climb', 'model:grade']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(model);
});
