class Brand < ActiveRecord::Base
  validates :name,  :presence => true, :uniqueness => true
  
  validates :url, :icon, :presence => true

  has_many :press_releases, :order => 'date DESC'
  has_many :products, :dependent => :destroy, :order => 'model'
  has_many :categories, :dependent => :destroy, :order => 'sort_order, name'
  
  has_many :brand_tags, :dependent => :destroy

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
