class CreateMpgControls < ActiveRecord::Migration[5.1]
  def change
    create_table :mpg_controls do |t|
      t.integer :year
      t.integer :month
      t.references :service_of_dependence, foreign_key: true

      t.timestamps
    end
  end
end
