import DS from 'ember-data';

var attr = DS.attr;

export default DS.Model.extend({
  name: attr('string'),
  country: attr('string'),
  climbs: DS.hasMany('climb'),
  ascents: DS.hasMany('ascent')
});
