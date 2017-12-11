class Report < ApplicationRecord
  belongs_to :service_of_dependence
  belongs_to :user
  has_many :report_details, dependent: :destroy
  validates :service_of_dependence, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :report_type, presence: true


  validates_uniqueness_of :report_type, :scope => [:service_of_dependence, :year, :month], :message => 'El Reporte ya ha sido creado'
  validates_associated :report_details
  accepts_nested_attributes_for :report_details, :reject_if => :all_blank, allow_destroy: true

  
  validate :validate_unique_report_detail

  def to_s
  	month.to_s + "/" + year.to_s + " - " + service_of_dependence.to_s
  end

  def validate_unique_report_detail
    validate_uniqueness_of_in_memory(
      report_details, [:agent], 'Agente Duplicado en el Reporte')
  end
end

module ActiveRecord
  class Base
    # Validate that the the objects in +collection+ are unique
    # when compared against all their non-blank +attrs+. If not
    # add +message+ to the base errors.
    def validate_uniqueness_of_in_memory(collection, attrs, message)
      hashes = collection.inject({}) do |hash, record|
        key = attrs.map {|a| record.send(a).to_s }.join
        if key.blank? || record.marked_for_destruction?
          key = record.object_id
        end
        hash[key] = record unless hash[key]
        hash
      end
      if collection.length > hashes.length
        errors[:base] << message
      end
    end
  end
end