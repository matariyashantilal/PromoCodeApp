class DashboardController < ApplicationController
  def show
  	if user_signed_in?
	  	if current_user.admin?
	  		redirect_to admin_root_path
	  	elsif current_user.business? 
	  		redirect_to business_root_path
	  	end
  	else
  		redirect_to new_user_session_path
  	end
  end

   def show_terms
      @terms = SettingContent.first.terms_condition
      render 'show_terms'
   end

   def show_about_us
      @about =  SettingContent.first.about_us
      render 'show_about_us'
   end
end
