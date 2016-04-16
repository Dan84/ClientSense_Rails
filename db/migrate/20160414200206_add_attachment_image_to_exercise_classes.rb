class AddAttachmentImageToExerciseClasses < ActiveRecord::Migration
  def self.up
    change_table :exercise_classes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :exercise_classes, :image
  end
end
