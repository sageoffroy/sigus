class MonthlyForGuardHour < ApplicationRecord
  belongs_to :agent, optional:true
  belongs_to :concept_1, :class_name => 'Concept', :foreign_key => 'concept_1_id', optional:true
  belongs_to :concept_2, :class_name => 'Concept', :foreign_key => 'concept_2_id', optional:true
  
  accepts_nested_attributes_for :concept_1
  accepts_nested_attributes_for :concept_2


  def with_coverage?
  	if hs_semana.nil? and gs_semana.nil? and hs_sabado.nil? and hs_domingo.nil?
  		return false
  	else
  		return true
  	end
  end

end
