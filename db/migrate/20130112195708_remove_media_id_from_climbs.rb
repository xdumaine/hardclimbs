class RemoveMediaIdFromClimbs < ActiveRecord::Migration
  def change
    remove_column :climbs, :media_id
  end
end
