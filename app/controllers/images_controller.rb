class ImagesController < ApplicationController

  before_filter :authenticate
  before_filter :set_page_title, :except => [:index]
  
  def index
    @presskit = find_brand_or_product
   
    @images = @presskit.images.all
    page_title << brand_or_product_name << 'Images'
    
  end  
  
  def show
    @presskit = find_brand_or_product
    
    @image = Image.find(params[:id]) 
    
    page_title << brand_or_product_name << @image.name
    
  end

  def new
    @presskit = find_brand_or_product
    
    @image = @presskit.images.new
    
    page_title << brand_or_product_name << 'Images' << 'New'
  end

  # GET /products/1/edit
  def edit
    @presskit = find_brand_or_product
    @image = @presskit.images.find(params[:id])
    page_title << brand_or_product_name << @image.name << 'Edit'
    
  end
  
  def create
        
    @presskit = find_brand_or_product
    
    #add model number to title before save
    params[:image][:name] = "#{@presskit.model} #{params[:image][:name]}"
    @image = @presskit.images.create(params[:image])
    
    if @image.save
     if product?
          redirect_to(product_images_path(@presskit, @presskit.images.all), :notice => 'Image was successfully created.')
        else
          redirect_to(brand_images_path(@presskit, @presskit.images.all), :notice => 'Image was successfully created.')
        end 
    else
     render :action => "new"
    end    
    
  end
  
  def update
    @presskit = find_brand_or_product
    @image = @presskit.images.find(params[:id])


      if @image.update_attributes(params[:image])
        if product?
          redirect_to(product_images_path(@presskit, @presskit.images.all), :notice => 'Image was successfully updated.')
        else
          redirect_to(brand_images_path(@presskit, @presskit.images.all), :notice => 'Image was successfully updated.')
        end    
      else
        render :action => "edit"
      end
  end
  
  def destroy
    @presskit = find_brand_or_product
    @image = @presskit.images.find(params[:id])
    @image.destroy
    if product?
      redirect_to product_images_path(@presskit)
    else
      redirect_to brand_images_path(@presskit)
    end    
  end
  
  private

    def set_page_title
      page_title << "Presskits"
    end
    

    def find_brand_or_product
      Product.where(:id => params[:product_id]).first || Brand.where(:id => params[:brand_id]).first
    end
    
    def brand_or_product_name
      if product? 
        @presskit.model
      else
        @presskit.name
      end
    end
    
    def product?
      Product.where(:id => params[:product_id]).first
    end
    
  
end