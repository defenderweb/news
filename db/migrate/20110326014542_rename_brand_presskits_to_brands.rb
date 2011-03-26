class RenameBrandPresskitsToBrands < ActiveRecord::Migration
  def self.up
    rename_table :brand_presskits, :brands
    rename_column :categories, :brand_presskit_id, :brand_id
    rename_column :products, :brand_presskit_id, :brand_id
  end

  def self.down
    rename_column :products, :brand_id, :brand_presskit_id
    rename_column :categories, :brand_id, :brand_presskit_id
    rename_table :brands, :brand_presskits
  end
end