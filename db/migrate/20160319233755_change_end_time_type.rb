class ChangeEndTimeType < ActiveRecord::Migration
  def change
  	change_column :appointments ,:end_time,  :datetime
  end
end
