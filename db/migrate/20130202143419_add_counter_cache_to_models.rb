class AddCounterCacheToModels < ActiveRecord::Migration
  def change
    add_column :areas, :climbs_count, :integer, :default => 0
    add_column :areas, :ascents_count, :integer, :default => 0
    Area.reset_column_information
    Area.find(:all).each do |p|
      Area.update_counters p.id, :climbs_count => p.climbs.length
      Area.update_counters p.id, :ascents_count => p.ascents.length
    end
      
    add_column :climbs, :climbers_count, :integer, :default => 0
    add_column :climbs, :ascents_count, :integer, :default => 0
    add_column :climbs, :medias_count, :integer, :default => 0
    Climb.reset_column_information
    Climb.find(:all).each do |p|
      Climb.update_counters p.id, :climbers_count => p.climbers.length
      Climb.update_counters p.id, :ascents_count => p.ascents.length
      Climb.update_counters p.id, :medias_count => p.medias.length
    end
    
    add_column :ascents, :medias_count, :integer, :default => 0
    Ascent.reset_column_information
    Ascent.find(:all).each do |p|
      Ascent.update_counters p.id, :medias_count => p.media.length
    end
    
    add_column :climbers, :climbs_count, :integer, :default => 0
    add_column :climbers, :ascents_count, :integer, :default => 0
    Climber.reset_column_information
    Climber.find(:all).each do |p|
      Climber.update_counters p.id, :climbs_count => p.climbs.length
      Climber.update_counters p.id, :ascents_count => p.ascents.length
    end
    
    add_column :grades, :ascents_count, :integer, :default => 0
    Grade.reset_column_information
    Grade.find(:all).each do |p|
      Grade.update_counters p.id, :ascents_count => p.ascents.length
    end
    
  end
end
