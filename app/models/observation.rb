class Observation < ApplicationRecord
	belongs_to :report_detail, optional:true
	belongs_to :agent, optional:true
	belongs_to :observation_description, optional:true
end
