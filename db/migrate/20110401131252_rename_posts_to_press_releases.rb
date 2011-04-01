class RenamePostsToPressReleases < ActiveRecord::Migration
  def self.up
    rename_table :posts, :press_releases
    rename_column :brands, :post_id, :press_release_id
    rename_column :tags, :post_id, :press_release_id
    rename_column :comments, :post_id, :press_release_id    
  end

  def self.down
    rename_column :brands, :press_release_id, :post_id
    rename_table :press_releases, :posts
  end
end
