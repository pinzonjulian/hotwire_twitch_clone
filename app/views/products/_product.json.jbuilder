json.extract! product, :id, :name, :live_stream_id, :created_at, :updated_at
json.url product_url(product, format: :json)
