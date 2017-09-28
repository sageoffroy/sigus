class ServiceOfDependence < ApplicationRecord
  belongs_to :service
  belongs_to :dependence
  has_many :agent_of_service

  def to_s
  	"(" + dependence.code.to_s + ") " + service.name
  end

  

end
