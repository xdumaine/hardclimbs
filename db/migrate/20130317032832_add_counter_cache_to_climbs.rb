class AddCounterCacheToClimbs < ActiveRecord::Migration
  def change
    add_column :grades, :climbs_count, :integer, :default => 0
    Grade.reset_column_information
    Grade.find(:all).each do |p|
      Grade.update_counters p.id, :climbs_count => p.climbs.length
      #Grade.update_counters p.id, :ascents_count => p.ascents.length
    end
  end
end
