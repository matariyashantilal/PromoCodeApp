json.array!(@business_offers) do |business_offer|
  json.extract! business_offer, :id
  json.url business_offer_url(business_offer, format: :json)
end
