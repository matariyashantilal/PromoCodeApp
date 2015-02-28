json.array!(@stores) do |store|
  json.extract! store, :id, :name, :address, :latitude, :longitute, :contact_person, :contact_number
  json.url store_url(store, format: :json)
end
