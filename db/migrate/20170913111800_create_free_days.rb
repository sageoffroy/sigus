class CreateFreeDays < ActiveRecord::Migration[5.1]
  def change
    create_table :free_days do |t|
      t.date :day
      t.string :description

      t.timestamps
    end
  end
end
