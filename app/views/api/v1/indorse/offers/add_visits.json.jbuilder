json.result do
json.messages "ok"
json.rstatus  "1"
json.errorcode ""
end
json.data do
	json.array! @valid_offers.each do |offer|	
  	json.id offer.id
  	json.offer_name offer.offer_name
  	json.offer_for offer.offer_for
    json.image offer.image.url
    json.offer_type offer.offer_type      
  	json.offer_valid_upto offer.offer_valid_upto
	  if offer.offer_type == "OneTime"
      json.task_to_perform offer.task_to_perform
      json.task_url offer.task_url
    else
      json.punch_count offer.punch_count
      json.visit_count VisitorDetail.get_visitor_detail(@current_user.id,@store.id,offer.created_at).count
    end
    json.is_claim_status offer.check_stutus_is_claimed(@current_user.id)	end	
end
