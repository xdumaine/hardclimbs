class CreateMediasAscentsTable < ActiveRecord::Migration
  def self.up
    create_table :ascents_medias, :id => false do |t|
        t.references :media
        t.references :ascent
    end
    add_index :ascents_medias, [:media_id, :ascent_id]
    add_index :ascents_medias, [:ascent_id, :media_id]
  end

  def self.down
    drop_table :ascents_medias
  end

end
