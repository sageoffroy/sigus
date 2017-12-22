json.extract! office_hour_detail, :id, :office_hour_id, :agent_id, :turno_hora, :lunes, :martes, :miercoles, :jueves, :viernes, :sabado, :domingo, :total_hours, :created_at, :updated_at
json.url office_hour_detail_url(office_hour_detail, format: :json)
