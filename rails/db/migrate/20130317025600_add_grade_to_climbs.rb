class AddGradeToClimbs < ActiveRecord::Migration
  def change
    add_column :climbs, :grade_id, :integer
    for ascent in Ascent.all
      if ascent.ascent_number == 1
        climb = Climb.find_by_id(ascent.climb)
        grade = ascent.grade
        climb.update_attributes(:grade_id => ascent.grade.id)
        puts "Update climb #{climb.name} with grade #{grade.name}"
      end
    end
  end
end
