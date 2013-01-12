class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :url, :description
      t.references :media_types
      t.timestamps
    end
  end
end
