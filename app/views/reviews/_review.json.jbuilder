json.extract! review, :id, :item_id, :user_id, :text, :rate, :created_at, :updated_at
json.url review_url(review, format: :json)
