class AddPostsToBrands < ActiveRecord::Migration
  
  def self.up        
    add_index :brands, :post_id
  end

  def self.down
    change_table :brands do |t|
      t.remove :post_id
    end
  end
  
end
