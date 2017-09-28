class Dependence < ApplicationRecord
	has_one :service_of_dependence

	def to_s
		name
	end
end
