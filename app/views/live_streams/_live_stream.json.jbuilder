json.extract! live_stream, :id, :name, :url, :created_at, :updated_at
json.url live_stream_url(live_stream, format: :json)
