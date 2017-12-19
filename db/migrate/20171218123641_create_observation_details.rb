class CreateObservationDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :observation_details do |t|
      t.references :observation, foreign_key: true
      t.references :agent, foreign_key: true
      t.references :observation_description, foreign_key: true
      t.date :date_from
      t.integer :total_days
      t.string :description

      t.timestamps
    end
  end
end
