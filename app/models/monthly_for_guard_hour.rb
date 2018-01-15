class MonthlyForGuardHour < ApplicationRecord
  belongs_to :agent, optional:true
  belongs_to :concept_1, :class_name => 'Concept', :foreign_key => 'concept_1_id', optional:true
  belongs_to :concept_2, :class_name => 'Concept', :foreign_key => 'concept_2_id', optional:true
  
  accepts_nested_attributes_for :concept_1
  accepts_nested_attributes_for :concept_2
end
