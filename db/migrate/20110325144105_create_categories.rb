class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.references :brand_presskit
      
      t.timestamps
    end
    
    add_index :categories, :brand_presskit_id
    
  end

  def self.down
    drop_table :categories
  end
end
