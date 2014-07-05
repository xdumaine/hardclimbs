class AddNotesToClimbs < ActiveRecord::Migration
  def change
    add_column :climbs, :notes, :text
  end
end
