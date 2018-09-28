class FreeDay < ApplicationRecord
 	validates :day, presence: true
 	validates :description, presence: true
 	validates :scope, presence: true
 	validates :day, uniqueness: true

 	belongs_to :dependence

	def local?
 		scope == "Local"
 	end

 	def provincial?
 		scope == "Provincial"
 	end

 	def nacional?
 		scope == "Nacional"
 	end

end
