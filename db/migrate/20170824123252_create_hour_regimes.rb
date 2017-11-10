class CreateHourRegimes < ActiveRecord::Migration[5.1]
  def change
    create_table :hour_regimes do |t|
      t.integer :hours
      t.boolean :with_guard
      t.string :description
      

      t.timestamps
    end
  end
end
