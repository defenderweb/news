class ImagesController < ApplicationController

  before_filter :authenticate
  before_filter :set_page_title, :except => [:index]
  
  def index
    @brand = Brand.find(params[:brand_id])
    @images = @brand.images.all
    page_title << @brand.name << 'Images'
  end  
  
  def show
    @brand = Brand.find(params[:brand_id])
    @image = Image.find(params[:id]) 
    
    page_title << @brand.name << @image.name
    
  end

  def new
    @image = Image.new
    @brand = Brand.find(params[:brand_id])
    page_title << @brand.name << 'Images' << 'New'
  end

  # GET /products/1/edit
  def edit
    @brand = Brand.find(params[:brand_id])
    @image = @brand.images.find(params[:id])
    page_title << @brand.name << @image.name << 'Edit'
    
  end
  
  def create
    @brand = Brand.find(params[:brand_id])
    @image = @brand.images.create(params[:image])
    redirect_to brand_path(@brand)
  end
  
  def update
    @brand = Brand.find(params[:brand_id])
    @image = @brand.images.find(params[:id])


      if @image.update_attributes(params[:image])
        redirect_to(brand_images_path(@brand, @brand.images.all), :notice => 'Image was successfully updated.')
      else
        render :action => "edit"
      end
  end
  
  def destroy
    @brand = Brand.find(params[:brand_id])
    @image = @brand.images.find(params[:id])
    @image.destroy
    redirect_to brand_images_path(@brand)    
  end
  
  private

    def set_page_title
      page_title << "Presskits"
    end
  
end