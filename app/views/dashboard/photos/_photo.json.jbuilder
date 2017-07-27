json.extract! photo, :id, :file, :item_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
