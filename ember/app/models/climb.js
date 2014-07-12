import DS from 'ember-data';

var attr = DS.attr;

export default DS.Model.extend({
  name: attr('string'),
  still_hard: attr('boolean'),
  notes: attr('string'),
  style: DS.belongsTo('style'),
  area: DS.belongsTo('area'),
  grade: DS.belongsTo('grade')
});
