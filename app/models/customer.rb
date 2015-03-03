class Customer < User
	has_many :offer_details,dependent: :destroy, foreign_key: "user_id"
	has_many :offers,through: :offer_details,dependent: :destroy
end
