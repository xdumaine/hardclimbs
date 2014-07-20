import { test, moduleForModel } from 'ember-qunit';

moduleForModel('grade', 'Grade', {
  // Specify the other units that are required for this test.
  needs: ['model:style', 'model:climb', 'model:ascent']
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(model);
});
