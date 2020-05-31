# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    return if current_user

    redirect_to root_url
  end

  # POST /resource/sign_in
  def create
    # super
    Rails.logger.info "Signing in..."
    Rails.logger.info current_user
    if current_user && (current_user.has_role? :admin)
      redirect_to(admin_resources_path) && return
    else
      redirect_to(resources_path) && return
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
