class Report < ApplicationRecord
  belongs_to :service_of_dependence
  belongs_to :user
  has_many :report_details, dependent: :destroy
  accepts_nested_attributes_for :report_details, :reject_if => :all_blank, allow_destroy: true
end
