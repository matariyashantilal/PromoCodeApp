class ChangeDataTypeForStoreContactNumber < ActiveRecord::Migration
  def up
   change_column :stores, :contact_number, :string
  end

  def down
   change_column :stores, :contact_number, :integer
  end
end
