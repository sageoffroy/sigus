class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.integer :year, foreign_key: true
      t.integer :month, foreign_key: true
      t.references :service_of_dependence, foreign_key: true
    	t.references :agent, foreign_key: true
      t.references :observation_description, foreign_key: true
      t.date :date_from
      t.integer :total_days
      t.string :description
      t.integer :prop_hs
      t.integer :prop_hs_umu
      t.timestamps
    end
  end
end
