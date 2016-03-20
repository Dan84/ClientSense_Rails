class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :appointment_at
      t.time :duration
      t.boolean :confirmed, default: false
      t.integer :trainer_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
