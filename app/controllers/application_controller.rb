class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      (user_name == 'admin' && password == 'foobar') || (user_name == 'jeffm@cwdlimited.com' && password == 'foobar')
    end if Rails.env.production?
  end
end
