class Offer < ActiveRecord::Base
	belongs_to :store
	belongs_to :business
	has_many :offer_details,:dependent=> :destroy
end
