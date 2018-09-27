json.extract! inquiry, :id, :house_id, :user_id, :subject, :message, :created_at, :updated_at
json.url inquiry_url(inquiry, format: :json)
