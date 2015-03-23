class AddColumnToBusiness < ActiveRecord::Migration
  def change
  	add_column :users, :business_name, :string
  	add_column :users, :address, :string
  	add_column :users, :contact_person, :string
  	add_column :users, :contact_number, :string
  end
end
