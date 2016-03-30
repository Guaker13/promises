class UsersController < ApplicationController
  # Do not forget to add only: [:action] if necessary
  before_action :set_user

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Do not forget to update the strong params here under
  # if you want
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :provider)
  end
end
