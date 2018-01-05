class ChangeDateTypeForDescription < ActiveRecord::Migration[5.1]
  def change
  	change_column :concepts, :description, :string
  end
end
