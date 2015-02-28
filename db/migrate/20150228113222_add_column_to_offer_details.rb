class AddColumnToOfferDetails < ActiveRecord::Migration
  def change
    add_column :offer_details, :is_claimed, :boolean ,default: false
  end
end
