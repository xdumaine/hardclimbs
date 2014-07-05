class AddAscentNumberToAscents < ActiveRecord::Migration
  def change
    add_column :ascents, :ascent_number, :integer
  end
end
