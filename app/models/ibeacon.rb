class Ibeacon < ActiveRecord::Base
	belongs_to :store

	validates_presence_of :udid
	validate :validate_store_presence

	def validate_store_presence
	   	if !store_id.present? && !new_record?
    		errors.add(:store_id, "can't be blank. Please create the new one.")
    	end
  	end
end
