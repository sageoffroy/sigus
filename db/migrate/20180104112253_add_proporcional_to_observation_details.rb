class AddProporcionalToObservationDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :observation_details, :proporcional, :integer
  end
end
