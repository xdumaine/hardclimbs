class CreateAscentsClimbersJoinTable < ActiveRecord::Migration
  def change
      create_table :ascents_climbers, :id => false do |t|
        t.integer :ascent_id
        t.integer :climber_id
      end
    end
end
