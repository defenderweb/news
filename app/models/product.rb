class Product < ActiveRecord::Base
  # validates :name,  :presence => true
  
  # has_many :posts
  belongs_to :brand_presskit
end
