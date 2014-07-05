class AddAreasToClimbs < ActiveRecord::Migration
  def change
    add_column :climbs, :area_id, :integer
  end
end
