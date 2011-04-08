class RenameImageFileToImageAsset < ActiveRecord::Migration
  def self.up
    rename_column :images, :file, :asset
  end

  def self.down
    rename_column :images, :asset, :file
  end
end
