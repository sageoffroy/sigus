class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.string :flag
      t.string :shield

      t.timestamps
    end
  end
end
