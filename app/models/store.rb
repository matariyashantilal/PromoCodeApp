class Store < ActiveRecord::Base
	belongs_to :business
	has_many   :offers,dependent: :destroy
	#has_many   :ibecons,dependent: :destroy

	
end
