class Concept < ApplicationRecord


	has_many :monthly_for_guard_hours
	
	def to_s
		value.to_s
	end
end
