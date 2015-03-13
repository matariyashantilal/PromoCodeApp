json.array!(@business_ibeacons) do |business_ibeacon|
  json.extract! business_ibeacon, :id
  json.url business_ibeacon_url(business_ibeacon, format: :json)
end
