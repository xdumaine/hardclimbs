class CreateClimbs < ActiveRecord::Migration
  def change
    create_table :climbs do |t|
      t.string :name
      
      t.references :style
      t.references :ascent
      t.references :media
      
      t.timestamps
    end
  end
end
