class ChangeColumnDurationInAppointments < ActiveRecord::Migration
  def change
  	change_column :appointments ,:duration,  :integer, :default 3600
  end
end
