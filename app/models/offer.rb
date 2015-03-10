class Offer < ActiveRecord::Base
	belongs_to   :store
	has_many :offer_details , dependent: :destroy
	#enumaration 
	enum offer_for: [ :new_user, :existing_user,:both_user ]

	#image
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	#Array
	OFFER_TYPE= %w(OneTime Punchcard)
	TASK_TO_PERFORM= %w(Facebook Twitter Instagram)
	
	#scope
	scope :new_user_offer, -> { where(offer_for: 0) }
	scope :existing_user_offer, -> { where(offer_for: 1) }
	scope :get_non_expired_offers, -> {where("offer_expire_on >= ?",Date.today.beginning_of_day)}



	#install method

	def check_stutus_is_claimed(userid)
		offer_detail=offer_details.find_by(user_id:userid)
		offer_detail.present? ? offer_detail.is_claimed.present? ? true : false : false
	end
end
