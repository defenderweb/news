class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private

  #def authenticate
  
    # authenticate_or_request_with_http_basic do |user_name, password|
    #   (user_name == 'admin' && password == 'x')
    # end if Rails.env.production?
  #end
  
  def page_title
    @page_title ||= []
  end
end
