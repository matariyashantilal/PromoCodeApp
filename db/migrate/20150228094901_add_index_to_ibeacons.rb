class AddIndexToIbeacons < ActiveRecord::Migration
  def change
    add_reference :ibeacons, :stores, index: true
  end
end
