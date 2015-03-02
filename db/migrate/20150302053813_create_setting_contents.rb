class CreateSettingContents < ActiveRecord::Migration
  def change
    create_table :setting_contents do |t|
      t.text :terms_condition
      t.text :about_us

      t.timestamps
    end
  end
end
