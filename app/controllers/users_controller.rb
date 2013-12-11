class UsersController < ApplicationController
  def profile
    @user=User.find current_user
    @user.skills.build
    @user.portfolios.build
  end
  def update
    @user=User.find params[:id]
    @user.update_attributes(params[:user])
    redirect_to profile_users_path
  end
end
