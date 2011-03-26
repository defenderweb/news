class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  def index
    @brand = Brand.find(params[:brand_id])
    @categories = @brand.categories.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
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
    

    redirect_to brand_path(@brand)
    
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.find(params[:id])
    @category.destroy

    redirect_to brand_path(@brand)
  end
end
