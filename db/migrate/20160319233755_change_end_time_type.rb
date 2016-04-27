class ChangeEndTimeType < ActiveRecord::Migration
  def change
  	change_column :appointments ,:end_time, 'timestamp USING CAST(end_time AS datetime without time zone)'
  end
end
