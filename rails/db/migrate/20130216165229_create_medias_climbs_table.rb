class CreateMediasClimbsTable < ActiveRecord::Migration
  def self.up
    create_table :climbs_medias, :id => false do |t|
        t.references :media
        t.references :climb
    end
    add_index :climbs_medias, [:media_id, :climb_id]
    add_index :climbs_medias, [:climb_id, :media_id]
  end

  def self.down
    drop_table :climbs_medias
  end
end
