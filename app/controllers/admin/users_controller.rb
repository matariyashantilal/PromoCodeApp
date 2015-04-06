class Admin::UsersController < Admin::BaseController
  def index
  end
 	def edit
  
  end
  def change_password
  	if params[:user][:current_password].present? && params[:user][:password].present?
      if current_user.update_with_password(changes_password_params)
        sign_in(current_user, bypass: true)
        redirect_to admin_root_path, :notice => "Password updated successfully."
   	  else
  	   	flash.now[:alert] = current_user.errors.full_messages.uniq
   	    render :edit
      end
    else
      if !params[:user][:current_password].present?
        flash.now[:alert] = "Current password can't be blank."
      elsif
        flash.now[:alert] = "New password can't be blank."
      end
     	#flash.now[:alert] = current_user.errors.full_messages.uniq
   	  render :edit
    end
  end

  private
  def changes_password_params
   params.require(:user).permit(:current_password,:password,:password_confirmation)
  end
end
