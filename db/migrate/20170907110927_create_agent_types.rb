class CreateAgentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :agent_types do |t|
      t.integer :code
      t.string :description
      t.integer :quant_hours
      t.timestamps
    end
  end
end
