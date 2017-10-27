class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :grouping
      t.string :clase
      t.string :grade
      t.string :hierarchy
      t.references :category

      t.timestamps
    end
  end
end
