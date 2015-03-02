class Customer < User
	
	has_many :offer_details,  through: :offers
end
