json.array!(@business_stores) do |business_store|
  json.extract! business_store, :id
  json.url business_store_url(business_store, format: :json)
end
