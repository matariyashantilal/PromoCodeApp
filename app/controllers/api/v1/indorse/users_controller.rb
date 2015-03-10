class Api::V1::Indorse::UsersController < Api::V1::BaseController
  before_filter :authentication_user_with_authentication_token, :only => [:update_notification]
  
  swagger_controller :users, "User[signup/signin/update_notification/login_with_facebook]"

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
    #host = Rails.application.secrets.host
    if params[:content_id] == '0'
      @result = '/terms'
      #@result = SettingContent.first.terms_condition.html_safe
      #@result = SettingContent.first.terms_condition
      #@result = "https://termsfeed.com/blog/sample-terms-and-conditions-template/"
    elsif  params[:content_id] == '1'
      @result = '/about'
      #@result = SettingContent.first.about_us.html_safe
      #@result = SettingContent.first.about_us
      #@result = "http://complitech.net/contact/"
    else
      render_json({:result=>{:messages =>"Sorry, no data was found.",:rstatus=>0, :errorcode =>404}}.to_json)
      return
    end
    render_json({:result=>{:messages =>"ok",:rstatus=>1,:errorcode =>""},:data=>{ :url => request.protocol + request.host_with_port + @result }}.to_json)
    #render_json({:result=>{:messages =>"ok",:rstatus=>1,:errorcode =>""},:data=>{ :url => @result }}.to_json)
  end

  swagger_api :setting_contents do
    summary "Send terms_condition and about_us data"
    param :path, :content_id, :string, :required, "content_id"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  
  def login_with_facebook
    if params[:user][:oauth_token].present?
       begin
        token       = FbGraph::User.me(params[:user][:oauth_token])
        @user_email = token.fetch.email
        puts("======#{@user_email}")
        @user       = User.find_by_email(@user_email)
        if @user.present?
            device_id = params[:user][:device_id]
            @user.check_duplicate_device_ids(params[:user][:device_id],@user)  
            #@user.check_duplicate_device_ids(device_id,@user)
            puts("======#{@user_email}========existing ")
            @authentication_token = @user.authentication_tokens.create(:auth_token => AuthenticationToken.generate_unique_token)
           # render :file => "api/v1/Indorse/users/sign_up"
        else
           @user = User.register_with_social_media(token,@user_email,params[:user][:oauth_token])
           if @user.save

              puts("======#{@user_email}========new user ")
              @authentication_token = @user.authentication_tokens.create(:auth_token => AuthenticationToken.generate_unique_token)
              # render :file => "api/v1/Indorse/users/sign_up"
           else
             render_json({:result=>{:messages => @user.display_errors,:rstatus=>0, :errorcode => 404}}.to_json)
           end
        end
        rescue  FbGraph::InvalidToken
          render_json({:result=>{:messages =>"Invalid Token",:rstatus=>0, :errorcode => 404}}.to_json)

      end
    else
       render_json({:result=>{:messages =>"Token missing",:rstatus=>0, :errorcode => 404}}.to_json)
    end
  end
  
   swagger_api :login_with_facebook do
    summary "Facebook login"
    param :form, "user[device_id]", :string, :optional, "Device id"
    param :form, "user[oauth_token]", :string, :required, "Authentication token from facebook"
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