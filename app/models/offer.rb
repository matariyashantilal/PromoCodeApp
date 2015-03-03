class Offer < ActiveRecord::Base
	belongs_to   :store
	has_many :offer_details
end
