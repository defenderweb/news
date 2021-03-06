class UsersController < ApplicationController
  
  before_filter :authenticate
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy, :new, :create]
  
  before_filter :set_page_title
  
  def index
    @users = User.all
    
  end
  
  
  def show
    @user = User.find(params[:id])
    @press_releases = @user.press_releases.paginate( :all, :per_page => 10, :page => params[:page] )

    page_title << @user.name
  end

  def new
    @user = User.new
    page_title << "New"
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    page_title << @user.name << "Edit"
  end
  
  def create
    @user = User.new(params[:user])    

    if @user.save
      redirect_to(users_url, :notice => 'User was successfully created!')
    else
     render :action => "new"
    end
    
  end
  
  # PUT /users/1
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      redirect_to(user_url, :notice => 'User was successfully updated!')
    else
      render :action => "edit"
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    
    if @user.admin? 
      redirect_to(users_url, :notice => "#{@user.name} is an Administrator cannot be deleted!")
    elsif @user.press_releases.exists?
      redirect_to(users_url, :notice => "#{@user.name} is the contact for active Press Releases and cannot be deleted!")
    else
      @user.destroy
      redirect_to(users_url)
    end
  end
  
  private

    def set_page_title
      page_title << "Users"
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path, :notice => 'You do not have privledges to edit other users.') unless ( current_user?(@user) || current_user.admin? )
    end
    
    def admin_user
      redirect_to(root_path, :notice => 'Only admin users can perform that action') unless current_user.admin?
    end
    
    

end
