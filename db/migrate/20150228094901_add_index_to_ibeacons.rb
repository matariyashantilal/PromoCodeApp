class AddIndexToIbeacons < ActiveRecord::Migration
  def change
    add_reference :ibeacons, :store, index: true
  end
end
