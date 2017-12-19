class ObservationDetail < ApplicationRecord
  belongs_to :observation
  belongs_to :agent
  belongs_to :observation_description
end
