class ReportDetail < ApplicationRecord
  belongs_to :report
  belongs_to :agent
  has_one :observation
  has_one :rotative_turn
  belongs_to :day1, :class_name => 'DayHour', :foreign_key => 'day1_id', optional:true
  belongs_to :day2, :class_name => 'DayHour', :foreign_key => 'day2_id', optional:true
  belongs_to :day3, :class_name => 'DayHour', :foreign_key => 'day3_id', optional:true
  belongs_to :day4, :class_name => 'DayHour', :foreign_key => 'day4_id', optional:true
  belongs_to :day5, :class_name => 'DayHour', :foreign_key => 'day5_id', optional:true
  belongs_to :day6, :class_name => 'DayHour', :foreign_key => 'day6_id', optional:true
  belongs_to :day7, :class_name => 'DayHour', :foreign_key => 'day7_id', optional:true
  belongs_to :day8, :class_name => 'DayHour', :foreign_key => 'day8_id', optional:true
  belongs_to :day9, :class_name => 'DayHour', :foreign_key => 'day9_id', optional:true
  belongs_to :day10, :class_name => 'DayHour', :foreign_key => 'day10_id', optional:true
  belongs_to :day11, :class_name => 'DayHour', :foreign_key => 'day11_id', optional:true
  belongs_to :day12, :class_name => 'DayHour', :foreign_key => 'day12_id', optional:true
  belongs_to :day13, :class_name => 'DayHour', :foreign_key => 'day13_id', optional:true
  belongs_to :day14, :class_name => 'DayHour', :foreign_key => 'day14_id', optional:true
  belongs_to :day15, :class_name => 'DayHour', :foreign_key => 'day15_id', optional:true
  belongs_to :day16, :class_name => 'DayHour', :foreign_key => 'day16_id', optional:true
  belongs_to :day17, :class_name => 'DayHour', :foreign_key => 'day17_id', optional:true
  belongs_to :day18, :class_name => 'DayHour', :foreign_key => 'day18_id', optional:true
  belongs_to :day19, :class_name => 'DayHour', :foreign_key => 'day19_id', optional:true
  belongs_to :day20, :class_name => 'DayHour', :foreign_key => 'day20_id', optional:true
  belongs_to :day21, :class_name => 'DayHour', :foreign_key => 'day21_id', optional:true
  belongs_to :day22, :class_name => 'DayHour', :foreign_key => 'day22_id', optional:true
  belongs_to :day23, :class_name => 'DayHour', :foreign_key => 'day23_id', optional:true
  belongs_to :day24, :class_name => 'DayHour', :foreign_key => 'day24_id', optional:true
  belongs_to :day25, :class_name => 'DayHour', :foreign_key => 'day25_id', optional:true
  belongs_to :day26, :class_name => 'DayHour', :foreign_key => 'day26_id', optional:true
  belongs_to :day27, :class_name => 'DayHour', :foreign_key => 'day27_id', optional:true
  belongs_to :day28, :class_name => 'DayHour', :foreign_key => 'day28_id', optional:true
  belongs_to :day29, :class_name => 'DayHour', :foreign_key => 'day29_id', optional:true
  belongs_to :day30, :class_name => 'DayHour', :foreign_key => 'day30_id', optional:true
  belongs_to :day31, :class_name => 'DayHour', :foreign_key => 'day31_id', optional:true
  
  #validates_uniqueness_of :agent, :scope => [:report]
  

  accepts_nested_attributes_for :rotative_turn
  accepts_nested_attributes_for :observation
  accepts_nested_attributes_for :day1
  accepts_nested_attributes_for :day2
  accepts_nested_attributes_for :day3
  accepts_nested_attributes_for :day4
  accepts_nested_attributes_for :day5
  accepts_nested_attributes_for :day6
  accepts_nested_attributes_for :day7
  accepts_nested_attributes_for :day8
  accepts_nested_attributes_for :day9
  accepts_nested_attributes_for :day10
  accepts_nested_attributes_for :day11
  accepts_nested_attributes_for :day12
  accepts_nested_attributes_for :day13
  accepts_nested_attributes_for :day14
  accepts_nested_attributes_for :day15
  accepts_nested_attributes_for :day16
  accepts_nested_attributes_for :day17
  accepts_nested_attributes_for :day18
  accepts_nested_attributes_for :day19
  accepts_nested_attributes_for :day20
  accepts_nested_attributes_for :day21
  accepts_nested_attributes_for :day22
  accepts_nested_attributes_for :day23
  accepts_nested_attributes_for :day24
  accepts_nested_attributes_for :day25
  accepts_nested_attributes_for :day26
  accepts_nested_attributes_for :day27
  accepts_nested_attributes_for :day28
  accepts_nested_attributes_for :day29
  accepts_nested_attributes_for :day30
  accepts_nested_attributes_for :day31
 
  

end
