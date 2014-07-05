class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.string :country
      
      t.string :slug
      t.timestamps
    end
    
    add_index :areas, :slug, unique: true
  end
end
