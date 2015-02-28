class CreateIibeacons < ActiveRecord::Migration
  def change
    create_table :iibeacons do |t|
      t.string :udid
      t.string :major
      t.string :minor

      t.timestamps
    end
  end
end
