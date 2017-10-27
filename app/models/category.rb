class Category < ApplicationRecord
	has_many :positions

	def to_s
		code.to_s
	end
end
