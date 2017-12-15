class CreateNoveltyDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :novelty_details do |t|
      t.references :novelty, foreign_key: true
      t.references :novelty_type, foreign_key: true
      t.references :agent, foreign_key: true
      t.integer :month_ref
      t.integer :year_ref
      t.string :description
      t.integer :hours_to_add
      t.integer :hours_to_remove
      t.integer :hours_agent_mpg
      t.string :hours_type
      t.integer :associated_concept
      t.timestamps
    end
  end
end
