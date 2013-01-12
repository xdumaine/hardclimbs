class AddReferenceToMedia < ActiveRecord::Migration
  def change
    remove_column :ascents, :media_id
    change_table :media do |t|
      t.references :climb
      t.references :ascent
    end
  end
end
