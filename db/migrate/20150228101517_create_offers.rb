class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :offer_name
      t.string :task_to_perform
      t.integer :offer_for
      t.string :offer_type
      t.integer :punch_count
      t.datetime :offer_valid_upto
      t.datetime :offer_expire_on

      t.timestamps
    end
  end
end
