class RemoveClimbAscentFromMedia < ActiveRecord::Migration
  def change
    remove_column :medias, :ascent_id
    remove_column :medias, :climb_id
  end
end
