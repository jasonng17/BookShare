json.array!(@users) do |user|
  json.extract! user, :name, :school, :department, :contact, :email
  json.url user_url(user, format: :json)
end
