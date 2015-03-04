class Store < ActiveRecord::Base
	belongs_to :business
	has_many   :offers,dependent: :destroy
	has_many   :offer_details,through: :offers,dependent: :destroy
	has_many   :ibeacons,dependent: :destroy
	has_many   :visitor_details , dependent: :destroy
	
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?	

	accepts_nested_attributes_for :offers, :allow_destroy => true
	accepts_nested_attributes_for :ibeacons, :allow_destroy => true
end
