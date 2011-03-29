module BrandsHelper
  def get_brands_of(division)
    sub_brands = Brand.where(:parent => division.name)
  end
end
