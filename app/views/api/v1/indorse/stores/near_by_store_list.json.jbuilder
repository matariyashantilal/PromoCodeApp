json.result do
json.messages "ok"
json.rstatus  "1"
json.errorcode ""
end
json.data do
json.stores do
    json.array! @stores.each do |store|
      json.id store.id
      json.name store.name
      json.address store.address
      json.latitude store.latitude
      json.longitude store.longitude
    	json.offers do
    		json.array! store.offers.each do |offer|
		      json.id offer.id
		      json.offer_name offer.offer_name
		      json.offer_valid_upto offer.offer_valid_upto
		      json.task_to_perform offer.task_to_perform
					json.task_url offer.task_url
					json.punch_count offer.punch_count
		    end
  		end
    end
  end
end