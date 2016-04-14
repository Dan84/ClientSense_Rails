class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender
      t.date :dob
      t.string :phone
      t.string :occupation
      t.string :goal
      t.integer :targetweight
      t.text :bio
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
