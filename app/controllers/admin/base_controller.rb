class Admin::BaseController < ApplicationController
	before_action :authenticate_user!,:check_for_admin
	layout 'admin'
	
	def check_for_admin
		if user_signed_in?
	  	if !current_user.admin?
	  		redirect_to edit_business_business_path(current_user)
	  	end
  	else
  		redirect_to new_user_session_path
  	end
	end

end
