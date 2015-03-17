json.result do
json.messages "ok"
json.rstatus  "1"
json.errorcode ""
end
json.data do
  json.store_id @offer.store.try(:id)
  json.store_name @offer.store.try(:name)
  json.store_address @offer.store.try(:address)
  json.store_latitude @offer.store.try(:latitude)
  json.store_longitude @offer.store.try(:longitude)
 
  json.id @offer.id
  json.offer_name @offer.offer_name
  json.offer_for @offer.offer_for
   json.image @offer.image.url
  json.offer_type @offer.offer_type
		     
  json.offer_valid_upto @offer.offer_valid_upto
  
  if @offer.offer_type == "OneTime"
    json.task_to_perform @offer.task_to_perform
    json.task_url @offer.task_url
    json.punch_count ""
    json.visit_count ""
  end
 json.is_claim_status @offer.check_stutus_is_claimed(@current_user.id)
      
end