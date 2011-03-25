class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml
  def index
    @brand_presskit = BrandPresskit.find(params[:brand_presskit_id])
    @categories = @brand_presskit.categories.all

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
    @brand_presskit = BrandPresskit.find(params[:brand_presskit_id])
    @category = @brand_presskit.categories.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @brand_presskit = BrandPresskit.find(params[:brand_presskit_id])
    @category = @brand_presskit.categories.create(params[:category])
    

    redirect_to brand_presskit_path(@brand_presskit)
    
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @brand_presskit = BrandPresskit.find(params[:brand_presskit_id])
    @category = @brand_presskit.categories.find(params[:id])

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
    @brand_presskit = BrandPresskit.find(params[:brand_presskit_id])
    @category = @brand_presskit.categories.find(params[:id])
    @category.destroy

    redirect_to brand_presskit_path(@brand_presskit)
  end
end
