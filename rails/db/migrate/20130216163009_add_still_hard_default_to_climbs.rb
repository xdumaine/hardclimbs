class AddStillHardDefaultToClimbs < ActiveRecord::Migration
  def change
    change_column :climbs, :still_hard, :boolean, :default => true
  end
end
