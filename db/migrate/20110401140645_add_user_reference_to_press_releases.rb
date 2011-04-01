class AddUserReferenceToPressReleases < ActiveRecord::Migration
  def self.up  
  
    change_table :press_releases do |t|     
      t.references :user
    end
        
    add_index :press_releases, :user_id
    
  end

  def self.down
  end
end
