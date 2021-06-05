json.extract! history, :id, :q, :lat, :lng, :created_at, :updated_at
json.url history_url(history, format: :json)
