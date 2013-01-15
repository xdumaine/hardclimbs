class AddSlugToAscents < ActiveRecord::Migration
  def change
    add_column :ascents, :slug, :string
    add_index :ascents, :slug, unique: true
  end
end
