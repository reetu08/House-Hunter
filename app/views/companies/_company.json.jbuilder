json.extract! company, :id, :name, :website, :addr, :found_year, :revenue, :synopsis, :created_at, :updated_at
json.url company_url(company, format: :json)
