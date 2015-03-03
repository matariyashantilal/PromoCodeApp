class CreateOfferDetails < ActiveRecord::Migration
  def change
    create_table :offer_details do |t|
      t.references :user, index: true
      t.references :offer, index: true
      t.boolean :is_claimed

      t.timestamps
    end
  end
end
