json.array!(@subscribers) do |subscriber|
  json.extract! subscriber, :id, :first_name, :email, :city, :country
  json.url subscriber_url(subscriber, format: :json)
end
