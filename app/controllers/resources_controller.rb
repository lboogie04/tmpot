class ResourcesController < ApplicationController
  before_action :authenticate

  def index
    Rails.logger.info current_user
  end


  protected

  def authenticate
    return if current_user

    redirect_to root_url
  end

end
