class CreateDependences < ActiveRecord::Migration[5.1]
  def change
    create_table :dependences do |t|
      t.integer :code
      t.string :name
      t.integer :complexity
      t.string :abbreviation

      t.timestamps
    end
  end
end
