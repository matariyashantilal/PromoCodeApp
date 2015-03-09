class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :device_id, :string
    add_column :users, :device_type, :string,default: 'iphone'
    add_column :users, :provider, :string
    add_column :users, :oauth_token, :string
  end
end
