class Offer < ActiveRecord::Base
	belongs_to   :store
	has_many :offer_details , dependent: :destroy
	
	before_save :check_offer_type_for
	#enumaration 
	enum offer_for: [ :new_user, :existing_user,:both_user ]

	##Validation

	validates :image, :attachment_presence => true
	validates_presence_of :offer_name
	validates :task_url, :presence => true, :if => lambda { |o| o.offer_type == "OneTime"}
	validates :punch_count, :presence => true, :inclusion => {:in => 1..8, :message => "should be between 1-8"}, :if => lambda { |o| o.offer_type == "Punchcard"}
	validate :validate_offer_dates
	validates :punch_count, :numericality => true,if: :punch_count?
  validate :validate_store_presence


	#image
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	#Array
	OFFER_TYPE= %w(OneTime Punchcard)
	TASK_TO_PERFORM= %w(Facebook Twitter Instagram)
	
	#scope
	scope :new_user_offer, -> { where("offer_for = ? OR offer_for = ?",0,2) }
	scope :existing_user_offer, -> { where("offer_for = ? OR offer_for = ?",1,2) }
	
	scope :get_non_expired_offers, -> {where("offer_expire_on >= ?",Date.today.beginning_of_day)}


  def validate_store_presence
    if !store_id.present? && !new_record?
      errors.add(:store_id, "can't be blank. Please create the new one.")
    end
  end

	def validate_offer_dates
    
    # errors.add(:offer_valid_upto, "can't be in the past") if
    #   offer_valid_upto < Date.today && offer_valid_upto < offer_expire_on

    if offer_expire_on < Date.today
    	errors.add(:offer_expire_on, "can't be in the past")
    end
    if offer_valid_upto < offer_expire_on
    		errors.add(:offer_valid_upto, "should be greater than expire date")
    end

  end

  def check_offer_type_for
  	if  offer_type == "Punchcard"
  		puts("==========#{offer_type}")
  		 write_attribute(:task_to_perform,nil)
  		 write_attribute(:task_url,nil)
  	else
  		 write_attribute(:punch_count,nil)
  	end
  end

  def get_expire_remaining_time
  	diff=TimeDifference.between(self.offer_expire_on,Date.today).in_days
  	if diff.to_i <= 0 
  		diff=TimeDifference.between(self.offer_expire_on,Date.today).in_hours
  		if diff.to_i <= 0
  			diff="#{diff} Hour"
  		else 
  		diff=	"#{diff} Hours"
  		end
  	else
  		diff =  "#{diff.to_i} Days"
  	end
  	diff
  end

  def get_image_url
  	Rails.application.secrets.host + self.image.try(:url)
  end

	#install method

	def check_stutus_is_claimed(userid)
		offer_detail=offer_details.where(user_id:userid ,is_claimed: false)

		offer_detail.present? ?  true : false 
	end

  def used_reward_offer
    offer = offer_details.where(is_claimed: true)
    offer.present? ? true : false 
  end

end
