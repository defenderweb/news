class Category < ActiveRecord::Base
  validates :name,  :presence => true,
                    :uniqueness => { :case_sensitive => false }
  
  belongs_to :brand

  has_many :products
end
