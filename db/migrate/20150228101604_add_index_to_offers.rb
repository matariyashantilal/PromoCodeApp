class AddIndexToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :store, index: true
  end
end
