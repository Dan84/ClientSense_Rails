class ChangeDurationColumnName < ActiveRecord::Migration
  def change
  	rename_column :appointments ,:duration, :end_time
  end
end
