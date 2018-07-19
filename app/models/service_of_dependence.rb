class ServiceOfDependence < ApplicationRecord
  belongs_to :service
  belongs_to :dependence
  has_many :agent_of_services

  def to_s
  	"(" + dependence.code.to_s + ") " + service.name
  end

  def to_s_id
  	"(" + id.to_s + ") " + service.name
  end

  def service_name
  	service.name
  end

  

end
