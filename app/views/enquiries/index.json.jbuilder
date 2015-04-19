json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :first_name, :email, :phone, :message
  json.url enquiry_url(enquiry, format: :json)
end
