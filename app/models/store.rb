class Store < ActiveRecord::Base
	geocoded_by :address
	
	belongs_to :business
	has_many   :offers,dependent: :destroy
	has_many   :offer_details,through: :offers,dependent: :destroy
	has_many   :ibeacons,dependent: :destroy

	
end
