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
  
  def create
    @user = User.new(params[:user])    

    if @user.save
      redirect_to(@user, :notice => 'Post was successfully created.')
    else
     render :action => "new"
    end
    
  end

end
