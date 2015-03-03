class Customer < User
	has_many :offer_details,dependent: :destroy
	has_many :offers,through: :offer_details,dependent: :destroy
end
