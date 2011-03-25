class Category < ActiveRecord::Base
  belongs_to :brand_presskit
  has_many :products
end
