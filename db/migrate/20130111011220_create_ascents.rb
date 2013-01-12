class CreateAscents < ActiveRecord::Migration
  def change
    create_table :ascents do |t|
      t.date :date
      t.references :climb
      t.references :media
      t.timestamps
    end
  end
end
