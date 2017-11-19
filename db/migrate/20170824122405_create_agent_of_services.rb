class CreateAgentOfServices < ActiveRecord::Migration[5.1]
  def change
    create_table :agent_of_services do |t|
      t.references :agent, foreign_key: true
      t.references :service_of_dependence, foreign_key: true
      t.string :function
      t.string :description
      t.timestamps
    end
  end
end
