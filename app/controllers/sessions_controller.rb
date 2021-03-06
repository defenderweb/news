class SessionsController < ApplicationController
 
  before_filter :set_page_title
  
  def new
    
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      render 'new'
    else
      sign_in user
      redirect_back_or root_path
      flash[:success] = "Welcome #{user.name}!"
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
    flash[:success] = "You have been successfully logged out."
  end
  
  private

    def set_page_title
      page_title << "Sign In"
    end
  
end
