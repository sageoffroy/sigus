class AddHoursMgToAgents < ActiveRecord::Migration[5.1]
  def change
    add_column :agents, :hours_mg_1, :integer
    add_column :agents, :hours_mg_2, :integer



  end
end