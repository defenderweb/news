class Post < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
                    
  has_many :comments, :dependent => :destroy #this dependent/destroy bit means if the post is deleted all comments go with it
  has_many :tags
  has_many :brands
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true, 
                                       :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
end
