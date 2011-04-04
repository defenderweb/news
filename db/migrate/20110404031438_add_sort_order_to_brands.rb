class AddSortOrderToBrands < ActiveRecord::Migration
  def self.up
    add_column :brands, :sort_order, :integer
  end

  def self.down
    remove_column :brands, :sort_order
  end
end