class CreateVisitorDetails < ActiveRecord::Migration
  def change
    create_table :visitor_details do |t|
      t.references :user, index: true
      t.references :store, index: true
      t.boolean :is_claim,default: false

      t.timestamps
    end
  end
end
