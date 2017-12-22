class OfficeHour < ApplicationRecord
	belongs_to :service_of_dependence
  has_many :office_hour_details, dependent: :destroy

  validates :service_of_dependence, presence: true
  validates :year, presence: true
  validates :month, presence: true
  
  validates_associated :office_hour_details
  accepts_nested_attributes_for :office_hour_details, :reject_if => :all_blank, allow_destroy: true

end
