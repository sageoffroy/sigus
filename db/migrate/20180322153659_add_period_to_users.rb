class AddPeriodToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :period, :string
  end
end
