class CreatePercentageMonths < ActiveRecord::Migration[5.1]
  def change
    create_table :percentage_months do |t|
      t.integer :mes
      t.float :valor

      t.timestamps
    end
  end
end
