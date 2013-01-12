class RemoveReferenceFromClimb < ActiveRecord::Migration
  def change
    remove_column :climbs, :ascent_id
  end

end
