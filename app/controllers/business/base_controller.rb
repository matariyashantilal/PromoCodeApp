class Business::BaseController < ApplicationController
	before_action :authenticate_user!
	
	layout 'business'
end
