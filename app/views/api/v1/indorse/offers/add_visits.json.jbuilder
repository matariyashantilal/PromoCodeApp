json.result do
json.messages "ok"
json.rstatus  "1"
json.errorcode ""
end
json.data do
	json.array! @offers.each do |offer|	
  	json.id offer.id
  	json.offer_name offer.offer_name
  	json.offer_valid_upto offer.offer_valid_upto
  	json.task_to_perform offer.task_to_perform
  	json.is_claim_status offer.check_stutus_is_claimed(@current_user.id) if offer.offer_details.present? 
    json.task_url offer.task_url
		json.punch_count offer.punch_count
	end	
end