json.result do
json.messages "ok"
json.rstatus  "1"
json.errorcode ""
end
json.data do
  json.id @offer.id
  json.offer_name @offer.offer_name
  json.offer_for @offer.offer_for
  json.offer_type @offer.offer_type
		     
  json.offer_valid_upto @offer.offer_valid_upto
  
  if @offer.offer_type == "OneTime"
    json.task_to_perform @offer.task_to_perform
    json.task_url @offer.task_url
  else
    json.punch_count @offer.punch_count
  end
 json.is_claim_status @offer.check_stutus_is_claimed(@current_user.id)
      
end