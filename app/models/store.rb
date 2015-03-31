class Store < ActiveRecord::Base
	belongs_to :business
	has_many   :offers,dependent: :destroy
	has_many   :offer_details,through: :offers,dependent: :destroy
	has_many   :ibeacons,dependent: :destroy
	has_many   :visitor_details , dependent: :destroy
	
	validates_presence_of :name, :address, :contact_person, :longitude, :latitude,:contact_number
	validates :contact_number,  length: { is: 10,message:"should be of 10 characters."} ,if: :contact_number?
	validates :contact_number, :numericality => true,if: :contact_number?
	validates_associated :offers, :ibeacons
	validates_uniqueness_of :name, :scope => [:address], :message => "and address already taken."
	geocoded_by :address
	#after_validation :geocode, :if => :address_changed?	

	accepts_nested_attributes_for :offers, :allow_destroy => true
	accepts_nested_attributes_for :ibeacons, :allow_destroy => true
end
