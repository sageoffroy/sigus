class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :year, foreign_key: true
      t.integer :month, foreign_key: true
      t.integer :total_hs
      t.integer :total_hs_umu
      t.integer :total_hs_nov
      t.integer :total_hs_exc
      t.string :report_type
      t.references :service_of_dependence, foreign_key: true
      t.references :user
      t.timestamps
    end
  end
end
