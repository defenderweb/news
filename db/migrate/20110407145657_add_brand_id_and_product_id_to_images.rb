class AddBrandIdAndProductIdToImages < ActiveRecord::Migration
  def self.up
    
    change_table :images do |t|
     
      t.references :product
      t.references :brand

    end
    
    add_index :images, :product_id
    add_index :images, :brand_id
    
  end

  def self.down
    remove_column :images, :product_id
    remove_column :images, :brand_id
  end
end
