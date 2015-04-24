json.result do
json.messages "ok"
json.rstatus  "1"
json.errorcode ""
end
json.data do
  json.use do
    @stores.each do |store|
      offerDetails = store.offer_details.where("is_claimed=true AND user_id = ?",@current_user.id)
      json.array! offerDetails.each do |offerDetail|
        offer=Offer.find(offerDetail.offer_id)
        if offer.used_reward_offer.present?
          json.id offer.id
          json.store_name store.name
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
          json.used_at  offer.offer_details.first.created_at
        end
      end      
    end
  end
end