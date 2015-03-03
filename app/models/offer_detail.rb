class OfferDetail < ActiveRecord::Base
  belongs_to :customer,class_name: "Customer", foreign_key: :user_id
  belongs_to :offer
end
