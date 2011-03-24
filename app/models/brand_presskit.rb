class BrandPresskit < ActiveRecord::Base
  # validates :name,  :presence => true
  
  # has_many :posts
  has_many :products
end
