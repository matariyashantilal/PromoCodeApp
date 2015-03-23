class Business::BaseController < ApplicationController
	before_action :authenticate_user!,:check_for_admin

	
	layout 'business'
	def check_for_admin
		if user_signed_in?
	  	if !current_user.business?
	  		redirect_to admin_root_path
	  	end
  	else
  		redirect_to new_user_session_path
  	end
	end
end
