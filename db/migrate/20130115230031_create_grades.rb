class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name
      t.integer :rank
      t.references :styles
      
      t.string :slug
      t.timestamps
    end
    
    add_index :grades, :slug, unique: true
    
  end
end
