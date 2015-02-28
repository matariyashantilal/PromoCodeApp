class AddIndexToIibeacons < ActiveRecord::Migration
  def change
    add_reference :iibeacons, :stores, index: true
  end
end
