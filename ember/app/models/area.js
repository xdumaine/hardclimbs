import DS from 'ember-data';

var attr = DS.attr;

export default DS.Model.extend({
  name: attr('string'),
  country: attr('string'),
  slug: attr('string'),

  climbs: DS.hasMany('climb', {async: true}),
  ascents: DS.hasMany('ascent', {async: true})
});
