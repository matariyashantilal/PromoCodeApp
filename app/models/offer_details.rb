class OfferDetails < ActiveRecord::Base
  belongs_to :customers ,:class => :Customer, :foreign_key => :user_id
  belongs_to :offer
end
