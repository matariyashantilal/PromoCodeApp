class CreateOfferDetails < ActiveRecord::Migration
  def change
    create_table :offer_details do |t|
      t.references :users, index: true
      t.references :offer, index: true

      t.timestamps
    end
  end
end
