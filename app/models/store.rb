class Store < ActiveRecord::Base
	belongs_to :business
	has_many   :offers,dependent: :destroy
	has_many   :offer_details,through: :offers,dependent: :destroy
	has_many   :ibeacons,dependent: :destroy

	
end
