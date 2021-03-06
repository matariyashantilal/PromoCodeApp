class Api::V1::Indorse::SessionsController < Api::V1::BaseController

  before_filter :authentication_user_with_authentication_token, :only => [:destroy]
  swagger_controller :sessions, "Logout"
  

  def destroy
    @token = AuthenticationToken.current_authentication_token_for_user(@current_user.id,params[:authentication_token]).first
    if @token.present?
      @token.destroy
       render_json({:result=>{:messages =>"ok",:rstatus=>1, :errorcode =>""},:data=>{:messages =>"Logout Successfully!"}}.to_json)
    else
      render_json({:errors => "No user found with authentication_token = #{params[:authentication_token]}"}.to_json)
    end
  end
  
  swagger_api :destroy do
    summary "logout"
    param :path, :authentication_token, :string,:required, "Auth Token"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

   def destroy_12
    @token = AuthenticationToken.current_authentication_token_for_user(@current_user.id,params[:authentication_token]).first
    if @token.present?
       @token.destroy
       render_json({:result=>{:messages =>"ok",:rstatus=>1, :errorcode =>""},:data=>{:messages =>"Logout Successfully!"}}.to_json)
    else
      render_json({:errors => "No user found with authentication_token = #{params[:authentication_token]}"}.to_json)
    end
  end
  
  swagger_api :destroy_12 do
    summary "logout"
    param :path, :authentication_token, :string,:required, "Auth Token"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  
end