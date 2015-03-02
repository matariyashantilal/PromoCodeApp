class Business < User
	has_many :stores
	has_many :offers,through: :stores
	has_many :stores, :dependent => :destroy
	has_many :offer_details, through: :offers
	accepts_nested_attributes_for :stores,:allow_destroy => true

end
