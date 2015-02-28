json.array!(@ibeacons) do |ibeacon|
  json.extract! ibeacon, :id, :udid, :major, :minor
  json.url ibeacon_url(ibeacon, format: :json)
end
