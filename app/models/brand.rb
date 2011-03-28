class Brand < ActiveRecord::Base
  validates :name,  :presence => true, :uniqueness => true

  # has_many :posts
  has_many :products
  has_many :categories
  # belongs_to :parent, :class_name => 'Brand'
end
