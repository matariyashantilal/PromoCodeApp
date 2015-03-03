class Api::V1::Indorse::OffersController < Api::V1::BaseController
  before_filter :authentication_user_with_authentication_token, :only => [:complete_task]
  
  swagger_controller :offers, "Offer[complete_task]"

  def complete_task
    @offer=Offer.find(params[:offer_id])
    puts("======#{@offer.inspect}=====")
    if @current_user.present? && @offer.present?
        @offer_details=OfferDetail.new(user_id: @current_user.id,offer_id: @offer.id)
        puts("============#{@offer_details.inspect}======")
        if !@offer_details.save
          render_json({:result=>{:messages =>@offer_details.display_errors,:rstatus=>0, :errorcode => 404}}.to_json)
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
end