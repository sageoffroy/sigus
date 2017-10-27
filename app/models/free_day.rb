class FreeDay < ApplicationRecord
 validates :day, presence: true
 validates :description, presence: true
 validates :scope, presence: true
 validates :day, uniqueness: true
end
