class RemoveAscentsCLimbers < ActiveRecord::Migration
  def change
    drop_table :ascents_climbers
  end

end
