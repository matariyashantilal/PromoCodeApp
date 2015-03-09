class OfferDetail < ActiveRecord::Base
  belongs_to :customer, class_name: "Customer", foreign_key: :user_id
  belongs_to :offer
	#validation  
  validates :offer_id, uniqueness: {scope: :user_id}, presence: true

  scope :check_stutus_is_claimed, -> (offer_id,user_id){ where("offer_id = ? and user_id = ?",offer_id,user_id)}
 
end