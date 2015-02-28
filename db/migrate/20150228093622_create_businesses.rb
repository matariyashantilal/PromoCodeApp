class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :address
      t.string :contact_person
      t.integer :contact_number

      t.timestamps
    end
  end
end
