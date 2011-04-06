class PressRelease < ActiveRecord::Base
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :user_id, :presence => true
                    
  has_many :comments, :dependent => :destroy #this dependent/destroy bit means if the press_release is deleted all comments go with it
  has_many :tags
  
  has_many :brand_tags, :dependent => :destroy
  has_many :brands, :through => :brand_tags
  
  belongs_to :brand
  belongs_to :user
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true, 
                                       :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
                                       
  scope :latest_press_releases, limit(5).order("date DESC")
  
  
end
