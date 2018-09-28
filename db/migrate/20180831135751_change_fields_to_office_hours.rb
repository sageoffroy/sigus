class ChangeFieldsToOfficeHours < ActiveRecord::Migration[5.1]
  def change
  	add_column :office_hours, :total_hours_sabado, :integer
  	rename_column :office_hours, :total_hours, :total_hours_semana
  end
end
