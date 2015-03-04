class VisitorDetail < ActiveRecord::Base
  belongs_to :customer,class_name: "Customer", foreign_key: :user_id
  belongs_to :store

  #scope

  scope :check_for_new, -> (user_id,store_id){ where("user_id = ? and store_id = ? and is_claim = ? ",user_id,store_id,true).count}
  scope :get_punch_count, -> (user_id,store_id){ where("user_id = ? and store_id = ? ",user_id,store_id).count}
end
