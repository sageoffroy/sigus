class CreateNovelties < ActiveRecord::Migration[5.1]
  def change
    create_table :novelties do |t|
      t.references :agent, foreign_key: true
      t.references :novelty_type, foreign_key: true
      t.integer :month
      t.integer :year
      t.integer :month_ref
      t.integer :year_ref
      t.string :description
      t.integer :hours_to_add
      t.integer :hours_to_remove
      
      t.timestamps
    end
  end
end
