class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :delete]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def search
  end

  def hot
  end

  def dashboard
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  # Do not forget to update the strong params here under
  # if you want
  def user_params
    params.require(:workspace).permit(:business_id, :capacity, :wifi)
  end
end
