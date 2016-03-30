class UsersController < ApplicationController
  # Do not forget to add only: [:action] if necessary
  before_action :set_user
  accepts_nested_attributes_for :worker
  after_create  :create_worker

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

  def create_worker
   user_worker = Worker.new(user: self)
   user_worker.save!(validate: false)
  end

  # Do not forget to update the strong params here under
  # if you want
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :provider, worker_attributes: [:working_style])
  end


end
