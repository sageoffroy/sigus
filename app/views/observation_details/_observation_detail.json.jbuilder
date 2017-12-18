json.extract! observation_detail, :id, :observation_id, :agent_id, :observation_description_id, :date_from, :total_days, :description, :created_at, :updated_at
json.url observation_detail_url(observation_detail, format: :json)
