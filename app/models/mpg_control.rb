class MpgControl < ApplicationRecord
  has_many :mpg_control_details, dependent: :destroy

  validates :year, presence: true
  validates :month, presence: true
  
  validates_associated :mpg_control_details
  accepts_nested_attributes_for :mpg_control_details, :reject_if => :all_blank, allow_destroy: true
end
