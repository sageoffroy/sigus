class Position < ApplicationRecord
	belongs_to :category

	def to_s

		grouping_letter = Array.new(["","A", "B", "C", "D"])

		grouping_letter[grouping.to_i] + " - " + clase + " - " + grade + " - " + category.to_s

	end

end
