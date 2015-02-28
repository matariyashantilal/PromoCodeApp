class AddIndexToOffers < ActiveRecord::Migration
  def change
    add_reference :offers, :stores, index: true
  end
end
