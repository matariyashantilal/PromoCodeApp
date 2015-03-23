class CreateIbeacons < ActiveRecord::Migration
  def change
    create_table :ibeacons do |t|
      t.string :udid
      t.string :major
      t.string :minor

      t.timestamps
    end
  end
end
