class ChangeDateFormatInExerciseClasses < ActiveRecord::Migration
  def change
  	change_column :exercise_classes, :date, :datetime
  end
end
