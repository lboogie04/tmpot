class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        # format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end


  protected

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :activated)
  end

  def authenticate
    return if current_user

    redirect_to root_url
  end

end
