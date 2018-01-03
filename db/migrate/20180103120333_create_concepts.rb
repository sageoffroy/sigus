class CreateConcepts < ActiveRecord::Migration[5.1]
  def change
    create_table :concepts do |t|
      t.integer :value
      t.integer :description

      t.timestamps
    end
  end
end
