class Observation < ApplicationRecord
	belongs_to :report_detail
	belongs_to :observation_description

end
