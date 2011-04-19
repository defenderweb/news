class Product < ActiveRecord::Base
  validates :model, :title,  :presence => true
  
  # has_many :press_releases
  belongs_to :brand
  belongs_to :category
  
  has_many :images, :dependent => :destroy
  
  scope :without_categories, where(:category_id => nil)
  

  
end
