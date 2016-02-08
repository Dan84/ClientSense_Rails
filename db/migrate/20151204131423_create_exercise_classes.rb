class CreateExerciseClasses < ActiveRecord::Migration
  def change
    create_table :exercise_classes do |t|
      t.string :title
      t.string :description
      t.integer :class_style_id
      t.integer :class_level_id
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :exercise_classes, [:user_id, :created_at]
  end
end
