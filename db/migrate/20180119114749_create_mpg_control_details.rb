class CreateMpgControlDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :mpg_control_details do |t|
      t.references :mpg_control, foreign_key: true
      t.references :agent, foreign_key: true
      t.integer :hs_guard
      t.integer :hs_umu
      t.string :description

      t.timestamps
    end
  end
end
