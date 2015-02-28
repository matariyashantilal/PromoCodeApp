class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitute
      t.string :contact_person
      t.integer :contact_number

      t.timestamps
    end
  end
end
