class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @users = User.all
  end
  
  def change
    user = User.find(params[:user][:id])
    if user.update(role_params)
      redirect_to users_show_path
    else
      render users_show_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def role_params
    params.require(:user).permit(:name, :email, :role_id)
  end
end
