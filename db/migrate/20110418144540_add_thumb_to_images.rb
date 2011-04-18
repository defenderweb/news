class AddThumbToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :thumb, :string
  end

  def self.down
    remove_column :images, :thumb
  end
end
