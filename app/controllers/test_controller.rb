class TestController < ApplicationController

  def index
    render :text => "Hello #{params[:foo] || "World"}"
  end
end
