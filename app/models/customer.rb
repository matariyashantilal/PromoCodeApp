class Customer < User
	has_many :offer_details
	has_many :offers,through: :offer_details
end
