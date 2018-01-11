class RotativeTurn < ApplicationRecord

	def to_s
		if is_complete
			days.to_s + " días / M-T-N"
		else
			days.to_s + " días / M-T"
		end
	end
	
end
