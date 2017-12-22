class CreateOfficeHours < ActiveRecord::Migration[5.1]
  def change
    create_table :office_hours do |t|
      t.integer :year
      t.integer :month
      t.references :service_of_dependence
      t.integer :total_hours
      t.string :description

      t.timestamps
    end
  end
end
