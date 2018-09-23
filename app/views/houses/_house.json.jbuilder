json.extract! house, :id, :company_id, :location, :area, :year_built, :style, :price, :floors, :has_basement, :owner, :phone, :email, :user_id, :image_path, :created_at, :updated_at
json.url house_url(house, format: :json)
