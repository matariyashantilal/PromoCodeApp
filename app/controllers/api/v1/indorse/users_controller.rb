class Api::V1::Indorse::UsersController < Api::V1::BaseController
  before_filter :authentication_user_with_authentication_token, :only => [:edit_profile]
  
  swagger_controller :users, "User[signup]"
  def sign_up
    @user = User.new(user_create_params)
    
    unless @user.save
      render_json({:result=>{:messages => @user.display_errors,:rstatus=>0, :errorcode => 404}}.to_json)
    else
      @authentication_token = @user.authentication_tokens.create(:auth_token => AuthenticationToken.generate_unique_token)
    end
  end
  
 swagger_api :sign_up do
    summary "Creates a new User"
    param :form, "user[email]", :string, :required, "Email"
    param :form, "user[password]", :string, :required, "password"
    param :form, "user[password_confirmation]", :string, :required, "password confirmation"
    param :form, "user[first_name]", :string, :required, "First name"
    param :form, "user[last_name]", :string, :required, "Last name"
    param :form, "user[role]", :integer, :required, "Role"
    param :form, "user[provider]", :string, :optional, "Provider"
    param :form, "user[ftoken]", :string, :optional, "ftoken"
 
    response :unauthorized
    response :not_acceptable
  end

  # def edit_profile
  #   @user = @current_user.update_attributes(user_edit_params)
  #   @current_user.password_not_required = 1
  #   if params[:profile_picture].present?
  #     @current_user.avatar1 = @current_user.decode_profile_picture_to_image_data(params[:profile_picture])
  #     @current_user.save
  #   end  
  #   unless @user
  #     render_json({:result=>{:messages =>@current_user.display_errors,:rstatus=>0, :errorcode => 404}}.to_json)
  #   end
  # end

  # swagger_api :edit_profile do
  #   summary "Edit Existing User"
  #   param :form, :authentication_token, :required, "Authentication token"
  #   param :form, "user[password]", :string, :required, "password"
  #   param :form, "user[password_confirmation]", :string, :required, "password confirmation"
  #   param :form, "user[first_name]", :string, :required, "First name"
  #   param :form, "user[last_name]", :string, :required, "Last name"
  #   param :form, :profile_picture, :string, :optional, "profile_picture in base64 format"
  #   response :unauthorized
  #   response :not_acceptable
  # end
  
  #  def login_with_facebook
  #   if params[:user][:fb_auth_token].present?
  #     begin
  #       token       = FbGraph::User.me(params[:user][:fb_auth_token])
  #       @user_email = token.fetch.email
  #       @user       = User.find_by_email(@user_email)
  #       if @user.present?
  #         #device_id = params[:user][:device_token]
  #         #@user.check_duplicate_device_ids(device_id,@user)
  #         @authentication_token = @user.authentication_tokens.create(:auth_token => AuthenticationToken.generate_unique_token)
  #         render :file => "api/v1/boudoir/users/sign_up"
  #       else
  #         @user = User.register_with_social_media(token,@user_email,params[:user][:fb_auth_token])
  #         if @user.save
  #           @authentication_token = @user.authentication_tokens.create(:auth_token => AuthenticationToken.generate_unique_token)
  #           render :file => "api/v1/boudoir/users/sign_up"
  #         else
  #           render_json({:result=>{:messages => @user.display_errors,:rstatus=>0, :errorcode => 404}}.to_json)
  #         end
  #       end
  #     rescue  FbGraph::InvalidToken
  #       render_json({:result=>{:messages =>"Invalid Token",:rstatus=>0, :errorcode => 404}}.to_json)

  #     end
  #   else
  #      render_json({:result=>{:messages =>"Token missing",:rstatus=>0, :errorcode => 404}}.to_json)
  #   end
  # end
  
  #  swagger_api :login_with_facebook do
  #   summary "Facebook login"
  #   param :form, "user[fb_auth_token]", :string, :required, "Authentication token from facebook"
  #   response :unauthorized
  #   response :not_acceptable
  # end

  
  private

  def user_create_params
    params.require(:user).permit(:email,:password,:password_confirmation,:first_name,:last_name,:role,:provider,:ftoken)
  end

  # def user_edit_params
  #    params.require(:user).permit(:password,:password_confirmation,:first_name,:last_name)
  # end
end