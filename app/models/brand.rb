class Brand < ActiveRecord::Base
  validates :name,  :presence => true, :uniqueness => true

  has_many :press_releases
  has_many :products
  has_many :categories
  # belongs_to :parent, :class_name => 'Brand'
  
  scope :divisions, where(:parent => "CWD")
  scope :main_division, where(:parent => "")
  
  
  def categories_with_products
    self.categories.select{|c| c.products.exists? }
  end
end
