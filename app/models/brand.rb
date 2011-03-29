class Brand < ActiveRecord::Base
  validates :name,  :presence => true, :uniqueness => true

  has_many :posts
  has_many :products
  has_many :categories
  # belongs_to :parent, :class_name => 'Brand'
  
  scope :divisions, where(:parent => "CWD")
  scope :main_division, where(:parent => "")
end
