class CreateRotativeTurns < ActiveRecord::Migration[5.1]
  def change
    create_table :rotative_turns do |t|
      t.integer :days
      t.boolean :is_complete
      t.references :report_detail
      t.timestamps
    end
  end
end
