class Offer < ActiveRecord::Base
	belongs_to   :store
	has_many :offer_details , dependent: :destroy
	#enumaration 
	enum offer_for: [ :new_user, :existing_user,:both_user ]

	##Validation

	validates :image, :attachment_presence => true
	validates_presence_of :offer_name
	validates :task_url, :presence => true, :if => lambda { |o| o.offer_type == "OneTime"}
	validates :punch_count, :presence => true, :inclusion => {:in => 1..8, :message => "should be between 1-8"}, :if => lambda { |o| o.offer_type == "Punchcard"}
	validate :validate_offer_dates

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

	def validate_offer_dates
    
    # errors.add(:offer_valid_upto, "can't be in the past") if
    #   offer_valid_upto < Date.today && offer_valid_upto < offer_expire_on

    if offer_expire_on < Date.today
    	errors.add(:offer_expire_on, "can't be in the past")
    end
    if offer_valid_upto < offer_expire_on
    		errors.add(:offer_valid_upto, "is be invalid")
    		logger.warn("===== Dates ====== #{offer_valid_upto}==== #{offer_expire_on}")
    	end

  end

	#install method

	def check_stutus_is_claimed(userid)
		offer_detail=offer_details.find_by(user_id:userid)
		offer_detail.present? ? offer_detail.is_claimed.present? ? true : false : false
	end
end
