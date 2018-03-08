class AddOficinaToAgents < ActiveRecord::Migration[5.1]
  def change
  	add_column :agents, :oficina, :integer
  end
end
