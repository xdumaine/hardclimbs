class RenameStylesIdInGrades < ActiveRecord::Migration
  def change
    rename_column :grades, :styles_id, :style_id
    add_column :ascents, :grade_id, :integer
  end
end
