class AddDateToAssessments < ActiveRecord::Migration
  def change
  	add_column :assessments, :date, :date
  end
end
