class CreateClassLevels < ActiveRecord::Migration
  def change
    create_table :class_levels do |t|
      t.string :level

      t.timestamps null: false
    end
  end
end
