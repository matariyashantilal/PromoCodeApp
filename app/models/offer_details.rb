class OfferDetails < ActiveRecord::Base
  belongs_to :users
  belongs_to :offers
end
