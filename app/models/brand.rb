class Brand < ActiveRecord::Base
  validates :name,  :presence => true, :uniqueness => true

  has_many :press_releases
  has_many :products
  has_many :categories

  scope :main_divisions, where(:parent => "")


  def categories_with_products
    self.categories.select{|c| c.products.exists? }
  end

  # ToDo: Refactor brand to use parent_id instead of the parent name
  def children
    Brand.where(:parent => self.name).order('sort_order, name')
  end

  def parent_brand
    Brand.where(:name => self.parent).first
  end

  def has_parent?
    self.parent.empty?
  end

  def divison?
    self.parent_brand.present? && self.parent_brand.has_parent?
  end

end
