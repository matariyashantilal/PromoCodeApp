class Admin::UsersController < Admin::BaseController
  def index
  end
 	def edit
  
  end
  def change_password
  	if params[:user][:current_password].present? && params[:user][:password].present?      	
      if current_user.update_with_password(changes_password_params)
        sign_in(current_user, bypass: true)
        redirect_to admin_root_path, :notice => "Updated your password succesfull."
   	  else
  	   	flash[:alert] = current_user.errors.full_messages
   	    render :edit
      end
    else
    	flash[:alert] = current_user.errors.full_messages
   	  render :edit
    end
  end

  private
  def changes_password_params
   params.require(:user).permit(:current_password,:password,:password_confirmation)
  end
end
