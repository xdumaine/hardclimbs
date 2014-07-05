class AddSlugToClimbs < ActiveRecord::Migration
  def change
    add_column :climbs, :slug, :string
    add_index :climbs, :slug, unique: true
  end
end
