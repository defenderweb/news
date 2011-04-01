class UsersController < ApplicationController
  
  
  def index
    @users = User.all
    @title = "Users"
    
  end
  
  
  def show
    @user = User.find(params[:id])
    @title = "User Profile | #{@user.name}"
  end

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
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
      redirect_to(users_url, :notice => 'User was successfully updated!')
    else
      render :action => "edit"
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(users_url)
  end

end
