class BrandTag < ActiveRecord::Base

  attr_accessible :brand_id
  
  belongs_to :brand
  belongs_to :press_release
  
end
