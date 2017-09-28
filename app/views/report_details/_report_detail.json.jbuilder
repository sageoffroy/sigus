json.extract! report_detail, :id, :report_id, :belong_service, :observation_id, :total_hours, :tr, :fm, :tnf, :tt, :hours_to_add, :hours_to_remove, :total_office_hours, :created_at, :updated_at
json.url report_detail_url(report_detail, format: :json)
