class HourRegime < ApplicationRecord

	def to_s
		wg = ""
		if with_guard
			wg = "C/G"	
		end
		hours.to_s + " " + wg
	end
end
