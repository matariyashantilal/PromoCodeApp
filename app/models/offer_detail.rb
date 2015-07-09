class OfferDetail < ActiveRecord::Base
  belongs_to :customer, class_name: "Customer", foreign_key: :user_id
  belongs_to :offer
	#validation  
  validates :offer_id, uniqueness: {scope: :user_id}, presence: true

  #scope
 	
  scope :check_for_new, -> (user_id){ where("user_id = ? ",user_id).first}


 
end