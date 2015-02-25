class Api::V1::Indorse::SessionsController < Api::V1::BaseController

  before_filter :authentication_user_with_authentication_token, :only => [:destroy]
  swagger_controller :sessions, "Login"
  def create
    @user = User.authenticate_user_with_auth(params[:email], params[:password])
    if @user.present?
      @authentication_token = @user.authentication_tokens.create(:auth_token => AuthenticationToken.generate_unique_token)
      #@user.check_duplicate_device_ids(params[:device_id],@user,params[:device_type])   
    else
      render_json({:result=>{:messages => User.invalid_credentials,:rstatus=>0, :errorcode => 404}}.to_json)
    end
  end
  
  swagger_api :create do
    summary "Usefull for login"
    param :path, :email, :password, :optional, "User"
    param :form, :email, :string, :required, "Email"
    param :form, :password, :string, :required, "Password"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end

  def destroy
    @token = AuthenticationToken.current_authentication_token_for_user(@current_user.id,params[:authentication_token]).first
    if @token.present?
      @token.destroy
      render_json({:message => "Logout Successfully!"}.to_json)
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
  
end