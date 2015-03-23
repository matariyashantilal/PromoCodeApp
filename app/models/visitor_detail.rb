class VisitorDetail < ActiveRecord::Base
  belongs_to :customer,class_name: "Customer", foreign_key: :user_id
  belongs_to :store

  #scope

  scope :check_for_new, -> (user_id,store_id){ where("user_id = ? and store_id = ? and is_claim = ? ",user_id,store_id,true).count}
  scope :get_visitor_detail, -> (user_id,store_id,date=nil){ where("user_id = ? and store_id = ? and created_at > ? and is_claim = ? ",user_id,store_id,date,false)unless date.nil?}
  scope :check_for_today_visit, -> (user_id,store_id){ where("user_id = ? and store_id = ? and created_at >= ? ",user_id,store_id,Date.today.beginning_of_day).count}

end
