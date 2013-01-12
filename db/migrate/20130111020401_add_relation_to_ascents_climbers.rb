class AddRelationToAscentsClimbers < ActiveRecord::Migration
  def change
    
    change_table :ascents do |t|
      t.references :climbers
    end
    
  end
end
