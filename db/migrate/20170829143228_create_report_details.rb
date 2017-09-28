class CreateReportDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :report_details do |t|
      t.references :report, foreign_key: true
      t.references :agent, foreign_key: true
      t.boolean :belong_service
      t.references :observation
      t.integer :observation_hours
      t.integer :total_hours
      t.string :tr
      t.string :fm
      t.string :tnf
      t.string :tt
      t.integer :hours_to_add
      t.integer :hours_to_remove
      t.integer :total_office_hours
      t.integer :day1
      t.integer :day2
      t.integer :day3
      t.integer :day4
      t.integer :day5
      t.integer :day6
      t.integer :day7
      t.integer :day8
      t.integer :day9
      t.integer :day10
      t.integer :day11
      t.integer :day12
      t.integer :day13
      t.integer :day14
      t.integer :day15
      t.integer :day16
      t.integer :day17
      t.integer :day18
      t.integer :day19
      t.integer :day20
      t.integer :day21
      t.integer :day22
      t.integer :day23
      t.integer :day24
      t.integer :day25
      t.integer :day26
      t.integer :day27
      t.integer :day28
      t.integer :day29
      t.integer :day30
      t.integer :day31
      t.timestamps
    end
  end
end
