json.array!(@iibeacons) do |iibeacon|
  json.extract! iibeacon, :id, :udid, :major, :minor
  json.url iibeacon_url(iibeacon, format: :json)
end
