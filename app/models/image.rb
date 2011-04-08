class Image < ActiveRecord::Base
  
  attr_accessible :name, :asset
  
  # validates :name,  :presence => true
  
  belongs_to :brand
  belongs_to :product
  
  mount_uploader :asset, AssetUploader
  
end