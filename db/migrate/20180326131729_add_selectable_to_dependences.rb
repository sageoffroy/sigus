class AddSelectableToDependences < ActiveRecord::Migration[5.1]
  def change
  	add_column :dependences, :selectable, :boolean
  	add_column :dependences, :area_code, :integer
  end
end
