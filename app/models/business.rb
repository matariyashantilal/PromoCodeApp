class Business < User
	has_many :stores,:dependent => :destroy
	has_many :offers,through: :stores , dependent: :destroy
	accepts_nested_attributes_for :stores,:allow_destroy => true
end
