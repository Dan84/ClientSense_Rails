class CreateClassStyles < ActiveRecord::Migration
  def change
    create_table :class_styles do |t|
      t.string :style

      t.timestamps null: false
    end
  end
end
