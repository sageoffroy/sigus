class ReportDetail < ApplicationRecord
  belongs_to :report
  belongs_to :agent, optional: true
  belongs_to :observation, optional:true
  validates :agent, uniqueness: true
  
  

end
