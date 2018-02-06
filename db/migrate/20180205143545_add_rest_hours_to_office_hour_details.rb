class AddRestHoursToOfficeHourDetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :office_hour_details, :rest_hours, :integer
  end
end
