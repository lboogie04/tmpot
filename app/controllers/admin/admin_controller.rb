class Admin::AdminController < ApplicationController
  before_filter :authenticate
  # after_filter :attempt_log_action
  # layout :set_layout


  def index
  end

  protected

  def authenticate
    return if current_user && (current_user.has_role? :admin)

    redirect_to root_url
  end

  def set_layout
    'admin'
  end
end
