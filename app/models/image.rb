class Image < ActiveRecord::Base
  
  validates :name,  :presence => true
  
  belongs_to :brand
  belongs_to :product
  
end