class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :grouping
      t.string :class
      t.string :grade
      t.string :hierarchy

      t.timestamps
    end
  end
end
