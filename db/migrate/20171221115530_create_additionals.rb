class CreateAdditionals < ActiveRecord::Migration[5.1]
  def change
    create_table :additionals do |t|
      t.integer :year
      t.integer :month
      t.references :service_of_dependence, foreign_key: true

      t.timestamps
    end
  end
end
