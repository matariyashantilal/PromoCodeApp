class Api::V1::Indorse::PasswordsController < Api::V1::BaseController
 before_filter :authentication_user_with_authentication_token, :only => [:change_password]
swagger_controller :passwords, "Password"
  def create
    if params[:email].present?
      @user = User.find_by_email(params[:email])
      if @user.present?
        @user.send_reset_password_instructions
        render_json({:result=>{:messages =>"ok",:rstatus=>1, :errorcode =>""},:data=>{:messages =>"You will receive an email with instructions about how to reset your password in a few minutes."}}.to_json)    
      else
        render_json({:result=>{:messages => "No user found with email #{params[:email]}",:rstatus=>0, :errorcode => 404}}.to_json)
      end
    else
      render_json({:result=>{:messages => "Email Address is required",:rstatus=>0, :errorcode => 404}}.to_json)
    end
  end
  
  
  swagger_api :create do
    summary "Forgot password"
    param :path, :email, :string,:required, "Email"
    param :form, :email, :string, :required, "Email"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  
   def change_password
    if params[:user][:current_password].present? && params[:user][:password].present?
      @user = @current_user.update_with_password(changes_password_params)
      if @user
        render_json({:result=>{:messages =>"ok",:rstatus=>1, :errorcode =>""},:data=>{:messages =>"Your Password Successfully updated"}}.to_json)
      else
        render_json({:result=>{:messages =>@current_user.display_errors,:rstatus=>0, :errorcode => 404}}.to_json)
      end
    else
      render_json({:result=>{:messages =>"Current Password and Password required",:rstatus=>0, :errorcode => 404}}.to_json)
    end
  end
  
   swagger_api :change_password do
    summary "Change Password"
    param :form, "user[current_password]", :string, :required, "Current password"
    param :form, "user[password]", :string, :required, "Password"
    param :form, "user[password_confirmation]", :required, "Password Confirmation"
    param :form, :authentication_token, :required, "Authentication token"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  
  private

  def changes_password_params
   params.require(:user).permit(:current_password,:password,:password_confirmation)
  end
end