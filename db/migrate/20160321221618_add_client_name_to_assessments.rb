class AddClientNameToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :client_name, :string
  end
end
