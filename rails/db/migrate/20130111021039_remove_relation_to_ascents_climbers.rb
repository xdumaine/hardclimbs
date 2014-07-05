class RemoveRelationToAscentsClimbers < ActiveRecord::Migration
  def change
    def change

      change_table :ascents do |t|
        t.references :climber
        remove_column :climbers_id
      end

    end
  end
end
