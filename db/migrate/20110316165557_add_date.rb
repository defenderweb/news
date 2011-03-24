class AddDate < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      
      t.date :date, :default => Time.now
    end
    Post.update_all ["date = ?", Time.now]
  end

  def self.down
    change_table :posts do |t|
      t.remove :date
    end
  end
end
