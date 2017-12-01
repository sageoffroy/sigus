class CreateHistoricalGuardAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :historical_guard_agents do |t|
      t.references :agent, foreign_key: true
      t.integer :month
      t.integer :year
      t.references :concept_1
      t.integer :hs_total_1
      t.references :concept_2
      t.integer :hs_total_2
      t.timestamps
    end
  end
end
