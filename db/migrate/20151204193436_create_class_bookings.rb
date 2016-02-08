class CreateClassBookings < ActiveRecord::Migration
  def change
    create_table :class_bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :exercise_class, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
