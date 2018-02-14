class OfficeHourDetail < ApplicationRecord
  belongs_to :office_hour
  belongs_to :agent

  
end
