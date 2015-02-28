class AddIndexToStores < ActiveRecord::Migration
  def change
    add_reference :stores, :businesses, index: true
  end
end
