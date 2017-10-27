class Service < ApplicationRecord
	has_many :service_of_dependences
	has_many :agent_of_services
	has_many :agents, through: :agent_of_services
	has_many :dependences, through: :service_of_dependences
	


	def to_s
		name
	end

	

	
end
