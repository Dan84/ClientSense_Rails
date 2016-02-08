class CreateClassTypes < ActiveRecord::Migration
  def change
    create_table :class_types do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
