class CreateObservationDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :observation_descriptions do |t|
      t.integer :code
      t.string :description

      t.timestamps
    end
  end
end
