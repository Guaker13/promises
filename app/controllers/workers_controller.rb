class WorkersController < ApplicationController
  before_action :set_worker

  def edit
  end

  def update
    @worker.update(worker_params)
    redirect_to user_path(current_user)
  end

  def set_worker
    @worker = User.find(params[:user_id]).worker
  end

  def worker_params
    params.require(:worker).permit({:working_style => []})
  end
end
