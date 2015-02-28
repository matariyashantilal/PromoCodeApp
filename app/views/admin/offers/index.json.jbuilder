json.array!(@offers) do |offer|
  json.extract! offer, :id, :offer_name, :task_to_perform, :offer_for, :offer_type, :punch_count, :offer_valid_upto, :offer_expire_on
  json.url offer_url(offer, format: :json)
end
