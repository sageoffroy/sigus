class ReportDetail < ApplicationRecord
  belongs_to :report
  belongs_to :agent
  has_one :observation
  has_one :rotative_turn
  validates :agent, uniqueness: true

  accepts_nested_attributes_for :rotative_turn
  accepts_nested_attributes_for :observation
  
  

end
