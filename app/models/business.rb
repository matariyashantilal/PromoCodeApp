class Business < User
	has_many :stores,dependent: :destroy
	has_many :offers,through: :stores , dependent: :destroy
	# has_many :offer_details,through: :offers , dependent: :destroy
	accepts_nested_attributes_for :stores,:allow_destroy => true

	validates_presence_of :business_name, :contact_person, :contact_number
	validates :contact_number, length: { is: 10 }
	validates_associated :stores
	
end
