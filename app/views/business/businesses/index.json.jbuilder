json.array!(@business_businesses) do |business_business|
  json.extract! business_business, :id
  json.url business_business_url(business_business, format: :json)
end
