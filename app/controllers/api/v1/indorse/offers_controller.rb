class Api::V1::Indorse::OffersController < Api::V1::BaseController
  before_filter :authentication_user_with_authentication_token, :only => [:complete_task,:add_visits]
  
  swagger_controller :offers, "Offer[complete_task/add_visits]"

  def complete_task
    @offer=Offer.get_non_expired_offers.find(params[:offer_id])
    puts("======#{@offer.inspect}=====")
    if @current_user.present? 
        if @offer.present?
            @offer_details=OfferDetail.new(user_id: @current_user.id,offer_id: @offer.id)
            puts("============#{@offer_details.inspect}======")
            if !@offer_details.save
              render_json({:result=>{:messages =>@offer_details.errors.full_messages,:rstatus=>0, :errorcode => 404}}.to_json)
            end
        else
           render_json({:errors => "Offer not found. Please enter a valid offer first."}.to_json)
        end
    else
        render_json({:errors => "No user found with authentication_token = #{params[:authentication_token]}"}.to_json)
    end
   
  end
  
  swagger_api :complete_task do
    summary "Perform Task "
    param :form, :authentication_token, :string,:required, "Auth Token"
    param :form, "offer_id", :string, :required, "offer_id"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

  def add_visits
    @store=Store.find(params[:store_id])
    if @store.present? && @current_user.present?
        visit_detail=VisitorDetail.new(store_id: @store.id,user_id: @current_user.id)
        @visit_count=VisitorDetail.get_visitor_detail(@current_user.id,@store.id).count
        check_new=VisitorDetail.check_for_new(@current_user.id,@store.id)
        @is_save=VisitorDetail.check_for_today_visit(@current_user.id,@store.id)  
        if @is_save == 0 
          if !visit_detail.save
            render_json({:result=>{:messages =>@visit_detail.errors.full_messages,:rstatus=>0, :errorcode => 404}}.to_json)
          end
        end        
        @offers = check_new != 0 ? Offer.get_non_expired_offers.existing_user_offer.where("punch_count <= ? ",@visit_count) : Offer.get_non_expired_offers.new_user_offer.where("punch_count <= ? ",@visit_count)
        puts("=====#{@offers.count}")
        if @offers.present?
            @offers.each do |offer|
                puts("==#{offer.inspect}")
                @visit_offer_count=VisitorDetail.get_visitor_detail(@current_user.id,@store.id,offer.created_at).count
                puts("==#{@visit_offer_count}")
                if offer.punch_count < @visit_offer_count
                    @offer_details=OfferDetail.new(user_id: @current_user.id,offer_id: offer.id)
                    @offer_details.save
                end
            end  
                   
        else 
            render_json({:errors => "Offer not found. Please enter a valid offer first."}.to_json)
        end 
    else
        render_json({:errors => "No user found with authentication_token = #{params[:authentication_token]}"}.to_json)
    end 
  end

  swagger_api :add_visits do
    summary "Register Visits "
    param :form, :authentication_token, :string,:required, "Auth Token"
    param :form, "store_id", :string, :required, "store_id"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

end