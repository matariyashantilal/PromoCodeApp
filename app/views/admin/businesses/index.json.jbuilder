json.array!(@businesses) do |business|
  json.extract! business, :id, :business_name, :address, :contact_person, :contact_number
  json.url business_url(business, format: :json)
end
