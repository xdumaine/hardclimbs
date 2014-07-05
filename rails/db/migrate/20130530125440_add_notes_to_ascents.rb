class AddNotesToAscents < ActiveRecord::Migration
  def change
    add_column :ascents, :notes, :text
  end
end
