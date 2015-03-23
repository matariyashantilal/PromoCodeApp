class CreateOfferDetails < ActiveRecord::Migration
  def change
    create_table :offer_details do |t|
      t.references :offer, index: true
      t.references :user, index: true
      t.boolean :is_claimed,default: false

      t.timestamps
    end
  end
end
