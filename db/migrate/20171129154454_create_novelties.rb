class CreateNovelties < ActiveRecord::Migration[5.1]
  def change
    create_table :novelties do |t|
      t.integer :year, foreign_key: true
      t.integer :month, foreign_key: true
      t.references :service_of_dependence, foreign_key: true
      t.references :agent, foreign_key: true
      t.references :novelty_type, foreign_key: true
      t.string :report_type
      t.integer :month_ref
      t.integer :year_ref
      t.string :description
      t.integer :hours_to_add
      t.integer :hours_to_remove
      t.integer :hours_agent_mpg
      
      t.timestamps
    end
  end
end
