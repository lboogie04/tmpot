class ResourcesController < ApplicationController

  def index
  end


  protected

  def authenticate
    return if current_user

    redirect_to root_url
  end

end
