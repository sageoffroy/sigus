class ReportDetail < ApplicationRecord
  belongs_to :report
  belongs_to :agent
  has_many :observations
  has_many :rotative_turns
  validates :agent, uniqueness: true

  accepts_nested_attributes_for :rotative_turns
  accepts_nested_attributes_for :observations
  
  

end
