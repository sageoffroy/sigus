class Report < ApplicationRecord
  belongs_to :service_of_dependence
  belongs_to :user
  has_many :report_details, dependent: :destroy
  validates :service_of_dependence, presence: true
  validates :year, presence: true
  validates :month, presence: true
   validates :report_type, presence: true

  validates_uniqueness_of :service_of_dependence, :scope => [:year, :month]
  accepts_nested_attributes_for :report_details, :reject_if => :all_blank, allow_destroy: true
  
  def to_s
  	month.to_s + "/" + year.to_s + " - " + service_of_dependence.to_s
  end


end
