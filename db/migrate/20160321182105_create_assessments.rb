class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.decimal :weight
      t.integer :bpsystolic
      t.integer :bpdiastolic
      t.decimal :bodyfat
      t.text :notes
      t.references :client, index: true, foreign_key: true
      t.references :trainer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
