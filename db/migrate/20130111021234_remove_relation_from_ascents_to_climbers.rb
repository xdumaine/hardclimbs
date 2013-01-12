class RemoveRelationFromAscentsToClimbers < ActiveRecord::Migration
    def change
      remove_column :ascents, :climbers_id
    end
end
