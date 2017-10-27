class CreateDayHours < ActiveRecord::Migration[5.1]
  def change
    create_table :day_hours do |t|
      t.date :day
      t.integer :hours
      t.boolean :is_umu

      t.timestamps
    end
  end
end
