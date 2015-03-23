class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_notification_enable, :boolean,default: true
  end
end
