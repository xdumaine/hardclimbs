class RenameColumnInMediaTable < ActiveRecord::Migration
  def change
    rename_column :medias, :media_types_id, :media_type_id
  end
end
