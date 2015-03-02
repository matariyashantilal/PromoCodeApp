class AddIndexToStores < ActiveRecord::Migration
  def change
    add_reference :stores, :business, index: true
  end
end
