class Admin::UsersController < Admin::AdminController

  def index
    @users = User.all
  end

  def edit
  end

end