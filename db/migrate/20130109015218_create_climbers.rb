class CreateClimbers < ActiveRecord::Migration
  def change
    create_table :climbers do |t|
      t.string :first_name, :last_name, :sex
      t.date :dob
      t.integer :height
      
      t.timestamps
    end
  end
end
