import DS from 'ember-data';

var attr = DS.attr;

export default DS.Model.extend({
  first_name: attr('string'),
  last_name: attr('string'),
  full_name: attr('string'),
  sex: attr('string'),
  dob: attr('date'),
  height: attr('number'),
  created_at: attr('date'),
  updated_at: attr('date'),
  slug: attr('string'),
  climbs_count: attr('number'),
  ascents_count: attr('number'),
  ascents: DS.hasMany('ascent')
});
