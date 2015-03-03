class OfferDetails < ActiveRecord::Base
	belongs_to :offer
	belongs_to :customer
end

