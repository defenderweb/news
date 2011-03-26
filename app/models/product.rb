class Product < ActiveRecord::Base
  # validates :name,  :presence => true
  
  # has_many :posts
  belongs_to :brand
  belongs_to :category
  
  scope :without_categories, where(:category_id => nil)
end
