class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
    	t.references :agent
      t.references :observation_description
      t.integer :month
      t.integer :year
      t.integer :total_days
      t.string :description
      t.timestamps
    end
  end
end
