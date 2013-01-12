class AddRelationBetweenAscentsClimbers < ActiveRecord::Migration
  def change
    change_table :ascents do |t|
      t.references :climber
    end
  end
end
