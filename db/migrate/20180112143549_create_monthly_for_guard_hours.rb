class CreateMonthlyForGuardHours < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_for_guard_hours do |t|
      t.references :agent, index: true
      t.integer :hs_semana
      t.integer :gs_semana
      t.integer :hs_sabado
      t.integer :hs_domingo
      t.references :concept_1, index: true
      t.integer :hs_total_1
      t.references :concept_2, index: true
      t.integer :hs_total_2

      t.timestamps
    end
  end
end
