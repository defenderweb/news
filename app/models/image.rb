

class Image < ActiveRecord::Base
  
  attr_accessible :name, :asset, :thumb, :remote_asset_url
  
  validates :name,  :presence => true, :uniqueness => true
  
  validates :asset,  :presence => true
  
  belongs_to :brand
  belongs_to :product
  
  mount_uploader :asset, AssetUploader
  mount_uploader :thumb, ThumbUploader
  
  def asset_info
    # TODO: ask nick if this actually loads the 1500 x 1500 image and slows everything down
    @image ||= MiniMagick::Image.open(asset.path)
  end
  
  
end