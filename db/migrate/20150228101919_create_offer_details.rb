class CreateOfferDetails < ActiveRecord::Migration
  def change
    create_table :offer_details do |t|
      t.references :users, index: true
      t.references :offers, index: true

      t.timestamps
    end
  end
end
