class ProductsController < ApplicationController

# before_filter :authenticate, :except => [:index, :show] #before_filter runs before everything else

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id]) 

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  

  # GET /products/1/edit
  def edit
    @brand_presskit = BrandPresskit.find(params[:brand_presskit_id])
    @product = @brand_presskit.products.find(params[:id])
    
  end

  # POST /products
  # POST /products.xml
  
  def create
    @brand_presskit = BrandPresskit.find(params[:brand_presskit_id])
    @product = @brand_presskit.products.create(params[:product])
    

    redirect_to brand_presskit_path(@brand_presskit)
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @brand_presskit = BrandPresskit.find(params[:brand_presskit_id])
    @product = @brand_presskit.products.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @brand_presskit = BrandPresskit.find(params[:brand_presskit_id])
    @product = @brand_presskit.products.find(params[:id])
    @product.destroy

    redirect_to brand_presskit_path(@brand_presskit)
  end
end
