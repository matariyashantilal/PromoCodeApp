class Api::V1::Indorse::UsersController < Api::V1::BaseController
  before_filter :authentication_user_with_authentication_token, :only => [:update_notification]
  
  swagger_controller :users, "User[signup/signin/update_notification]"

  def sign_up
    @user = User.find_by(email: params[:user][:email])
    if !(@user.present?)
      logger.warn("===========#{@user.inspect}")
      @user = User.create(user_create_params)
      unless @user.save
        render_json({:result=>{:messages => @user.display_errors,:rstatus=>0, :errorcode => 404}}.to_json)
      else
        @authentication_token = @user.authentication_tokens.create(:auth_token => AuthenticationToken.generate_unique_token)
      end
    else
      @user = User.authenticate_user_with_auth(params[:user][:email],params[:user][:password])  
      if @user.present?
        @authentication_token = @user.authentication_tokens.create(:auth_token => AuthenticationToken.generate_unique_token)
      else
       render_json({:result=>{:messages => User.invalid_credentials,:rstatus=>0, :errorcode => 404}}.to_json)
      end
    end   
  end
  
  swagger_api :sign_up do
    summary "Creates a new User"
    param :form, "user[email]", :string, :required, "Email"
    param :form, "user[password]", :string, :required, "password"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end


  def update_notification
    @user = @current_user.update_attributes(user_edit_notification)
    if @user
      render_json({:result=>{:messages =>"ok",:rstatus=>1, :errorcode =>""},:data=>{:messages =>"Your Notification Successfully updated"}}.to_json)
    else
      render_json({:result=>{:messages =>@current_user.display_errors,:rstatus=>0, :errorcode => 404}}.to_json)
    end
  end
  
  swagger_api :update_notification do
    summary "Update User Notification"
    param :form, :authentication_token, :required, "Authentication token"
    param :form, "user[is_notification_enable]", :string, :required, "is_notification_enable"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end


  def setting_contents
    if params[:content_id] == '0'
      @result = "terms"
      #@result = SettingContent.first.terms_condition
      #@result = "https://termsfeed.com/blog/sample-terms-and-conditions-template/"
    elsif  params[:content_id] == '1'
      @result = "about"
      #@result = SettingContent.first.about_us
      #@result = "http://complitech.net/contact/"
    else
      render_json({:result=>{:messages =>"Sorry no data found",:rstatus=>0, :errorcode =>404}}.to_json)
      return
    end
    render_json({:result=>{:messages =>"ok",:rstatus=>1},:data=>{ :url => @result }}.to_json)
  end

  swagger_api :setting_contents do
    summary "Send terms_condition and about_us data"
    param :path, :content_id, :string, :required, "content_id"
    #param :form, :content_id, :string, :required, "content_id"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  
  private

    def user_create_params
      params.require(:user).permit(:email,:password)
    end
    
    def user_edit_notification
      params.require(:user).permit(:is_notification_enable)
    end
end