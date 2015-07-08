class Api::V1::Indorse::StoresController < Api::V1::BaseController
  before_filter :authentication_user_with_authentication_token, :only => [:near_by_store_list,:my_rewards_detail,:my_used_rewards_detail]
  
  swagger_controller :stores, "Store[store_list/my_rewards_detail]"

  def near_by_store_list
    latitude  = params[:latitude].to_f
    longitude = params[:longitude].to_f
    if latitude.present? && longitude.present?
      puts "==========#{@current_user.inspect}========="
      @stores   = Store.near([latitude, longitude], 100).joins(:offers).where("offer_expire_on >= ? ",Date.today.beginning_of_day).includes(:ibeacons).uniq
      if !@stores.present?
        render_json({:result=>{:messages =>"No Stores Present.",:rstatus=>1, :errorcode =>""},:data=>{}}.to_json)    
      end
    else
      render_json({:result=>{:messages =>"Please enter a latitude and longitude.",:rstatus=>1, :errorcode =>""},:data=>{}}.to_json)
    end
  end
  
  swagger_api :near_by_store_list do
    summary "Get store List "
    param :form, :authentication_token, :string,:required, "Auth Token"
    param :form, "latitude", :string, :required, "latitude"
    param :form, "longitude", :string, :required, "longitude"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end


  def my_rewards_detail
  
    @stores   = Store.joins(:offers).joins(:offer_details).where("user_id = ? ",@current_user.id).uniq
    if !@stores.present?
      render_json({:result=>{:messages =>"Sorry,No rewards found.",:rstatus=>1, :errorcode =>""},:data=>{}}.to_json)    
    end  

  end
  
  swagger_api :my_rewards_detail do
    summary "Get offer for claim is allow"
    param :form, :authentication_token, :string,:required, "Auth Token"
   response :unauthorized
    response :not_acceptable
    response :not_found
  end

        
def my_used_rewards_detail
  
    @stores   = Store.joins(:offers).joins(:offer_details).where("user_id = ?   ",@current_user.id).uniq
    if !@stores.present?
      render_json({:result=>{:messages =>"Sorry,No Used rewards found.",:rstatus=>1, :errorcode =>""},:data=>{}}.to_json)    
    end  

end
  
  swagger_api :my_used_rewards_detail do
    summary "Get all used offer "
    param :form, :authentication_token, :string,:required, "Auth Token"
   response :unauthorized
    response :not_acceptable
    response :not_found
  end

end