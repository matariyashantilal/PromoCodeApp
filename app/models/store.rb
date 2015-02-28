class Store < ActiveRecord::Base
	belongs_to :business
	has_many :ibeacons, :dependent => :destroy
	has_many :offers, :dependent => :destroy
	
end
