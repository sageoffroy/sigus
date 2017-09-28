class Observation < ApplicationRecord

	def to_s
		"(" + number.to_s + ") " + description
	end
end
