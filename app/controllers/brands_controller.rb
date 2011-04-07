class BrandsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]
  before_filter :set_page_title
   
  # GET /brands
  def index
    @main_divisions = Brand.main_divisions
  end

  # GET /brands/1
  def show
    @brand = Brand.find(params[:id]) 
    @press_releases = @brand.press_releases.paginate( :all, :per_page => 3, :page => params[:page] )
    @product = @brand.products.new
    @category = @brand.categories.new
    @image = @brand.images.new
    
    page_title << @brand.name    
  end

  # GET /brands/new
  def new
    @brand = Brand.new
    page_title << 'New'
  end

  # GET /brands/1/edit
  def edit
    @brands = Brand.all
    @brand = Brand.find(params[:id])
    page_title << @brand.name
    page_title << 'Edit'
  end

  # POST /brands
  def create
    @brand = Brand.new(params[:brand])    

    if @brand.save
      redirect_to(@brand, :notice => 'Brand was successfully created.')
    else
      render :action => "new"
    end

  end

  # PUT /brands/1
  def update
    @brand = Brand.find(params[:id])
    
    if @brand.update_attributes(params[:brand])
      redirect_to(@brand, :notice => 'Brand was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /brands/1
  def destroy
    @brand = Brand.find(params[:id])
    
    if @brand.press_releases.exists?
      redirect_to(brand_url(@brand), :notice => "#{@brand.name} has active Press Releases and cannot be deleted!")
    else
      @brand.destroy
      redirect_to(brands_url)
    end
    
  end
  
  
  private

    def set_page_title
      page_title << "Presskits"
    end
    
end
