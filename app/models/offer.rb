class Offer < ActiveRecord::Base
	belongs_to :store
	has_many :offer_details,:dependent=> :destroy
end
