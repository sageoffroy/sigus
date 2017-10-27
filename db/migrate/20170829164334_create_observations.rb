class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.integer :number
      t.string :description
      t.date :date_up
      t.timestamps
    end
  end
end
