class Business < User
	has_many :stores, :dependent => :destroy
end
