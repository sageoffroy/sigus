json.extract! observation, :id, :number, :description, :created_at, :updated_at
json.url observation_url(observation, format: :json)
