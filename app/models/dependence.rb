class Dependence < ApplicationRecord
	has_many :service_of_dependences
	has_many :services, through: :service_of_dependences
	

	def to_s
		name
	end
end
