class RemoveTags < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.remove :tags
    end
  end

  def self.down
    change_table :posts do |t|
      t.string :tags
    end
  end
end