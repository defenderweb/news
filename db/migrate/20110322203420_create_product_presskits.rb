class CreateProductPresskits < ActiveRecord::Migration
  def self.up

    create_table :products do |t|
      t.string :title
      t.string :model
      t.references :brand_presskit

      t.timestamps
    end
    
    add_index :products, :brand_presskit_id
  end

  def self.down
    drop_table :products
  end
end
