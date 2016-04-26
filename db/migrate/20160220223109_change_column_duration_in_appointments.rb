class ChangeColumnDurationInAppointments < ActiveRecord::Migration
  def change
  	change_column(:appointments,:duration, :integer)
  end
end
