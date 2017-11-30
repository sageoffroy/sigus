class CreateNoveltyTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :novelty_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
