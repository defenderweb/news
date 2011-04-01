class PressReleasesController < ApplicationController
  
   before_filter :authenticate, :except => [:index, :show] #before_filter runs before everything else
   
  # GET /press_releases
  # GET /press_releases.xml
  def index
    @title = "All Press Releases"
    @press_releases = PressRelease.all :order => "date DESC"
    
    @brands = Brand.all

  end

  # GET /press_releases/1
  # GET /press_releases/1.xml
  def show
    @press_release = PressRelease.find(params[:id])
    @title = "Press Release | #{@press_release.title}" 
    
    # @brand = Brand.find(params[:brand_id])
    
  end

  # GET /press_releases/new
  # GET /press_releases/new.xml
  def new
    @press_release = PressRelease.new

  end

  # GET /press_releases/1/edit
  def edit
    @press_release = PressRelease.find(params[:id])
  end

  # POST /press_releases
  # POST /press_releases.xml
  def create
    @press_release = PressRelease.new(params[:press_release])    

    if @press_release.save
     redirect_to(@press_release, :notice => 'Press Release was successfully created.') 
    else
     render :action => "new"
    end
  end

  # PUT /press_releases/1
  # PUT /press_releases/1.xml
  def update
    @press_release = PressRelease.find(params[:id])

    if @press_release.update_attributes(params[:press_release])
      redirect_to(@press_release, :notice => 'Press Release was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /press_releases/1
  # DELETE /press_releases/1.xml
  def destroy
    @press_release = PressRelease.find(params[:id])
    @press_release.destroy

    redirect_to(press_releases_url)
      
  end
end
