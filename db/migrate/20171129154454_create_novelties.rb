class CreateNovelties < ActiveRecord::Migration[5.1]
  def change
    create_table :novelties do |t|
      t.integer :year, foreign_key: true
      t.integer :month, foreign_key: true
      t.references :service_of_dependence, foreign_key: true
      t.timestamps
    end
  end
end
