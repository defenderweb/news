class CreateBrandTags < ActiveRecord::Migration
  def self.up
    create_table :brand_tags do |t|
      t.integer :press_release_id
      t.integer :brand_id

      t.timestamps
    end
    add_index :brand_tags, :press_release_id
    add_index :brand_tags, :brand_id
    add_index :brand_tags, [:press_release_id, :brand_id], :unique => true
  end

  def self.down
    drop_table :brand_tags
  end
end
