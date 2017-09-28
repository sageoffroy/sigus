class CreateNationalities < ActiveRecord::Migration[5.1]
  def change
    create_table :nationalities do |t|
      t.string :code
      t.string :name
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
