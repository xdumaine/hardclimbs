import DS from 'ember-data';

var attr = DS.attr;

export default DS.Model.extend({
  date: attr('date'),
  climb_id: attr(),
  created_at: attr('date'),
  updated_at: attr('date'),
  slug: attr('string'),
  notes: attr('string'),
  medias_count: attr(),

  climber: DS.belongsTo('climber')
  //climb: DS.belongsTo('climb'),
  //grade: DS.belongsTo('grade')
});
