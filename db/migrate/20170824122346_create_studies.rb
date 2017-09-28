class CreateStudies < ActiveRecord::Migration[5.1]
  def change
    create_table :studies do |t|
      t.integer :level
      t.string :description

      t.timestamps
    end
  end
end
