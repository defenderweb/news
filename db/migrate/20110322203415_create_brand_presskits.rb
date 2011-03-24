class CreateBrandPresskits < ActiveRecord::Migration
  def self.up
    create_table :brand_presskits do |t|
      t.string :name
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :brand_presskits
  end
end
