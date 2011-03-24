class AddIcon < ActiveRecord::Migration
  def self.up
    change_table :brand_presskits do |t|
      t.string :icon, :default => "http://cwdlimited.com/images/news/brands/icons/cwd-icon.png"
    end
  end

  def self.down
    change_table :brand_presskits do |t|
      t.remove :icon
    end
  end
end

