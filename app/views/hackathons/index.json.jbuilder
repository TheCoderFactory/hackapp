json.array!(@hackathons) do |hackathon|
  json.extract! hackathon, :id, :name, :organisation, :website, :start_date, :end_date, :location_name, :street, :suburb, :state, :postcode, :country, :total_prize_value, :description, :logo, :registration_link, :user_id
  json.url hackathon_url(hackathon, format: :json)
end
