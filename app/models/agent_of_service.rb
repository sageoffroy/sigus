class AgentOfService < ApplicationRecord
  belongs_to :agent
  belongs_to :service_of_dependence
end
