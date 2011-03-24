class BrandPresskitsController < ApplicationController

# before_filter :authenticate, :except => [:index, :show] #before_filter runs before everything else
   
  # GET /brand_presskits
  # GET /brand_presskits.xml
  def index
    @brand_presskits = BrandPresskit.all :order => "parent"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brand_presskits }
    end
  end

  # GET /brand_presskits/1
  # GET /brand_presskits/1.xml
  def show
    @brand_presskit = BrandPresskit.find(params[:id]) 

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brand_presskit }
    end
  end

  # GET /brand_presskits/new
  # GET /brand_presskits/new.xml
  def new
    @brand_presskit = BrandPresskit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brand_presskit }
    end
  end

  # GET /brand_presskits/1/edit
  def edit
    @brand_presskits = BrandPresskit.all
    @brand_presskit = BrandPresskit.find(params[:id])
  end

  # POST /brand_presskits
  # POST /brand_presskits.xml
  def create
    @brand_presskit = BrandPresskit.new(params[:brand_presskit])    

    respond_to do |format|
      if @brand_presskit.save
        format.html { redirect_to(@brand_presskit, :notice => 'BrandPresskit was successfully created.') }
        format.xml  { render :xml => @brand_presskit, :status => :created, :location => @brand_presskit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brand_presskit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brand_presskits/1
  # PUT /brand_presskits/1.xml
  def update
    @brand_presskit = BrandPresskit.find(params[:id])

    respond_to do |format|
      if @brand_presskit.update_attributes(params[:brand_presskit])
        format.html { redirect_to(@brand_presskit, :notice => 'BrandPresskit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brand_presskit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /brand_presskits/1
  # DELETE /brand_presskits/1.xml
  def destroy
    @brand_presskit = BrandPresskit.find(params[:id])
    @brand_presskit.destroy

    respond_to do |format|
      format.html { redirect_to(brand_presskits_url) }
      format.xml  { head :ok }
    end
  end
end
