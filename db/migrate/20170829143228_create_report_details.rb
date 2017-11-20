class CreateReportDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :report_details do |t|
      t.references :report, foreign_key: true
      t.references :agent, foreign_key: true
      t.boolean :belong_service
      t.integer :total_hours_gs
      t.integer :total_hours_umu
      t.integer :total_hours
      t.boolean :fm
      t.boolean :tnf
      t.boolean :tt
      t.integer :hours_to_add
      t.integer :hours_to_remove
      t.integer :total_office_hours
      t.integer :day1_id, index: true
      t.integer :day2_id, index: true
      t.integer :day3_id, index: true
      t.integer :day4_id, index: true
      t.integer :day5_id, index: true
      t.integer :day6_id, index: true
      t.integer :day7_id, index: true
      t.integer :day8_id, index: true
      t.integer :day9_id, index: true
      t.integer :day10_id, index: true
      t.integer :day11_id, index: true
      t.integer :day12_id, index: true
      t.integer :day13_id, index: true
      t.integer :day14_id, index: true
      t.integer :day15_id, index: true
      t.integer :day16_id, index: true
      t.integer :day17_id, index: true
      t.integer :day18_id, index: true
      t.integer :day19_id, index: true
      t.integer :day20_id, index: true
      t.integer :day21_id, index: true
      t.integer :day22_id, index: true
      t.integer :day23_id, index: true
      t.integer :day24_id, index: true
      t.integer :day25_id, index: true
      t.integer :day26_id, index: true
      t.integer :day27_id, index: true
      t.integer :day28_id, index: true
      t.integer :day29_id, index: true
      t.integer :day30_id, index: true
      t.integer :day31_id, index: true
      t.timestamps
    end
  end
end
