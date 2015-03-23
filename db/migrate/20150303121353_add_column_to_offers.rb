class AddColumnToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :task_url, :string
  end
end
