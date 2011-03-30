class ProductsController < ApplicationController

# before_filter :authenticate, :except => [:index, :show] #before_filter runs before everything else

  # GET /products/1
  # GET /products/1.xml
  def show
    @brand = Brand.find(params[:brand_id])
    @product = Product.find(params[:id]) 
    @title = "Presskits | #{@brand.name} | #{@product.title} "
    
  end

  

  # GET /products/1/edit
  def edit
    @brand = Brand.find(params[:brand_id])
    @product = @brand.products.find(params[:id])
    
  end

  # POST /products
  # POST /products.xml
  
  def create
    @brand = Brand.find(params[:brand_id])
    @product = @brand.products.create(params[:product])
    

    redirect_to brand_path(@brand)
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @brand = Brand.find(params[:brand_id])
    @product = @brand.products.find(params[:id])


      if @product.update_attributes(params[:product])
        redirect_to(brand_product_path(@brand, @product), :notice => 'Product was successfully updated.')
      else
        render :action => "edit"
      end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @brand = Brand.find(params[:brand_id])
    @product = @brand.products.find(params[:id])
    @product.destroy

    redirect_to brand_path(@brand)
  end
end
