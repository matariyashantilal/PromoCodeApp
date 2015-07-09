json.result do
json.messages "ok"
json.rstatus    "1"
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
		  @existing_user=OfferDetail.where("user_id  = ? ",@current_user.id).first
		  if @existing_user.present? 
    	  offers = store.offers.get_non_expired_offers.existing_user_offer
      else 
        offers = store.offers.get_non_expired_offers.new_user_offer	
      end
	    	json.array! offers.each do |offer|
				json.id offer.id
				    json.offer_name offer.offer_name
				    json.offer_for offer.offer_for
		        json.offer_type offer.offer_type
		        json.image offer.get_image_url
			      json.offer_valid_upto offer.offer_valid_upto
				    json.expire_remaining offer.get_expire_remaining_time
				    if offer.offer_type == "OneTime"
				        json.task_to_perform offer.task_to_perform
		            json.task_url offer.task_url
		            json.punch_count ""
		            json.visit_count ""
		        else
		            json.task_to_perform ""
		            json.task_url ""
		            json.punch_count offer.punch_count
		            json.visit_count	VisitorDetail.get_visitor_detail(@current_user.id,store.id,offer.created_at).count
				end
				json.is_claim_status offer.check_stutus_is_claimed(@current_user.id)
		  end
		end
      json.ibeacons do
        json.array! store.ibeacons.each do |ibeacon|
          json.id ibeacon.id
          json.udid ibeacon.udid
          json.major ibeacon.major
          json.minor ibeacon.minor
        end
      end
    end
  end
  json.use do
     @stores.each do |store|
      offers=store.offers.get_non_expired_offers
      json.array! offers.each do |offer|
        status=offer.check_stutus_is_claimed(@current_user.id)
        if status.present?

          json.id offer.id
          json.offer_name offer.offer_name
          json.offer_for offer.offer_for
          json.offer_type offer.offer_type
          json.image offer.get_image_url
          json.offer_valid_upto offer.offer_valid_upto
          json.expire_remaining offer.get_expire_remaining_time
         
          if offer.offer_type == "OneTime"
            json.task_to_perform offer.task_to_perform
            json.task_url offer.task_url
            json.punch_count ""
            json.visit_count ""
        
          else
            json.task_to_perform ""
            json.task_url ""
            json.punch_count offer.punch_count
            json.visit_count VisitorDetail.get_visitor_detail(@current_user.id,store.id,offer.created_at).count
          end
          json.is_claim_status offer.check_stutus_is_claimed(@current_user.id)
        end
      end      
    end
  end
end