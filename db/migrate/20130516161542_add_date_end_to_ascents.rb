class AddDateEndToAscents < ActiveRecord::Migration
  def change
    add_column :ascents, :date_end, :date
    Ascent.all.each do |a|
      a.update_attributes(:date_end => a.date)
    end
  end
end
