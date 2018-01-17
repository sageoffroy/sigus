class AddProporcional2ToObservationDetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :observation_details, :proporcional2, :integer
  end
end
