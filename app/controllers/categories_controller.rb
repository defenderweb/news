class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  def index
    @brand = Brand.find(params[:brand_id])
    @categories = @brand.categories.all
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new
    @brand = Brand.find(params[:brand_id])
  end

  # GET /categories/1/edit
  def edit
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.create(params[:category])    
    
    if @category.save
     redirect_to(brand_path(@brand), :notice => 'Category was successfully created.') 
    else
     render :action => "new"
    end
        
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to(brand_categories_path(@brand), :notice => 'Category was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.find(params[:id])
    @category.destroy

    redirect_to brand_categories_path(@brand)
  end
end
