class AddParent < ActiveRecord::Migration
  def self.up
    change_table :brand_presskits do |t|
      t.string :parent, :default => "CWD"
    end
  end

  def self.down
    change_table :brand_presskits do |t|
      t.remove :parent
    end
  end
end

