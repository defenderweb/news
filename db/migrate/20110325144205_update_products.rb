class UpdateProducts < ActiveRecord::Migration
  def self.up
  
    change_table :products do |t|
     
      t.references :category

    end
    
    add_index :products, :category_id
  end

  def self.down
    drop_table :products
  end
end
