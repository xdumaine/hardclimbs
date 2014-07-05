class AddStillHardToClimbs < ActiveRecord::Migration
  def change
    add_column :climbs, :still_hard, :boolean
  end
end
