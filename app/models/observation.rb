class Observation < ApplicationRecord
	belongs_to :service_of_dependence
	has_many :observation_details, dependent: :destroy

  validates :service_of_dependence, presence: true
  validates :year, presence: true
  validates :month, presence: true
  
  validates_associated :observation_details
  accepts_nested_attributes_for :observation_details, :reject_if => :all_blank, allow_destroy: true
end
