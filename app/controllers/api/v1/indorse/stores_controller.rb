class Api::V1::Indorse::StoresController < Api::V1::BaseController
  before_filter :authentication_user_with_authentication_token, :only => [:near_by_store_list]
  
  swagger_controller :stores, "Store[store_list]"

  def near_by_store_list
    latitude  = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @stores   =Store.near([latitude, longitude], 100)..joins(:offers).where("offer_expire_on >= ?",Date.today.beginning_of_day).includes(:ibeacons)
    if @stores.present?

    else
      render_json({:errors => "No Store found"}.to_json)
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
end