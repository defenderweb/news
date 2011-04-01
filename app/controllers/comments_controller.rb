class CommentsController < ApplicationController
  
  before_filter :authenticate, :only => :destroy
  
  def create
    @press_release = PressRelease.find(params[:press_release_id])
    @comment = @press_release.comments.create(params[:comment])
    redirect_to press_release_path(@press_release)
  end
  
  def destroy
    @press_release = PressRelease.find(params[:press_release_id])
    @comment = @press_release.comments.find(params[:id])
    @comment.destroy
    redirect_to press_release_path(@press_release)    
  end
  
end
