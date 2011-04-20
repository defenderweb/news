

class Image < ActiveRecord::Base
  
  attr_accessible :name, :asset, :thumb
  
  validates :name,  :presence => true, :uniqueness => true
  
  validates :asset,  :presence => true
  
  belongs_to :brand
  belongs_to :product
  
  mount_uploader :asset, AssetUploader
  mount_uploader :thumb, ThumbUploader
  
end