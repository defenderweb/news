class AddCategoryIndexToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t| 
      t.references :brand
    end
    add_index :posts, :brand_id, :default => 1
  end

  def self.down
    change_table :posts do |t|
      t.remove :brand_id
    end
  end
end
