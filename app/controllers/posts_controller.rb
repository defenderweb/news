class PostsController < ApplicationController
  
   before_filter :authenticate, :except => [:index, :show] #before_filter runs before everything else
   
  # GET /posts
  # GET /posts.xml
  def index
    @title = "All Press Releases"
    @posts = Post.all :order => "date DESC"
    
    @brands = Brand.all

  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @title = "Press Release | #{@post.title}" 
    
    # @brand = Brand.find(params[:brand_id])
    
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])    

    if @post.save
     redirect_to(@post, :notice => 'Post was successfully created.') 
    else
     render :action => "new"
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to(@post, :notice => 'Post was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to(posts_url)
      
  end
end
