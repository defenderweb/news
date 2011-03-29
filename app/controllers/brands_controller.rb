class BrandsController < ApplicationController

# before_filter :authenticate, :except => [:index, :show] #before_filter runs before everything else
   
  # GET /brands
  def index
    @title = "Presskits"
    @brands = Brand.all :order => "parent"
    @divisions = Brand.divisions
    @main_division = Brand.main_division
  end

  # GET /brands/1
  def show
    @brand = Brand.find(params[:id]) 
    @product = @brand.products.new
    @title = "Presskits | #{@brand.name}"    
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
    @brands = Brand.all
    @brand = Brand.find(params[:id])
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
    @brand.destroy

    redirect_to(brands_url)
  end
end
