class Offer < ActiveRecord::Base
	belongs_to   :store
	has_many :offer_details , dependent: :destroy
	#enumaration 
	enum offer_for: [ :new_user, :existing_user,:both_user ]

	#scope
	scope :new_user_offer, -> { where(offer_for: 0) }
	scope :existing_user_offer, -> { where(offer_for: 1) }
	scope :get_non_expired_offers, -> {where("offer_expire_on >= ?",Date.today.beginning_of_day)}

end
