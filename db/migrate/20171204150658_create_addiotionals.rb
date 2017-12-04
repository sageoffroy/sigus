class CreateAddiotionals < ActiveRecord::Migration[5.1]
  def change
    create_table :addiotionals do |t|
      t.references :agent, foreign_key: true
      t.integer :year
      t.integer :month
      t.string :description
      t.boolean :fm
      t.boolean :tnf
      t.boolean :tt
      t.references :rotative_turn, foreign_key: true

      t.timestamps
    end
  end
end
