class Offer < ActiveRecord::Base
	belongs_to   :store
	has_many :offer_details , dependent: :destroy
	#enumaration 
	enum offer_for: [ :new_user, :existing_user,:both_user ]
end
