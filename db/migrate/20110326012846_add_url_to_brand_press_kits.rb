class AddUrlToBrandPressKits < ActiveRecord::Migration
  def self.up
    add_column :brand_presskits, :url, :string
  end

  def self.down
    remove_column :brand_presskits, :url
  end
end