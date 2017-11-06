class ReportDetail < ApplicationRecord
  belongs_to :report
  belongs_to :agent, optional: true
  belongs_to :observation, optional:true
  belongs_to :rotative_turn, optional:true
  validates :agent, uniqueness: true

  accepts_nested_attributes_for :rotative_turn, allow_destroy: true
  accepts_nested_attributes_for :observation, allow_destroy: true
  
  

end
