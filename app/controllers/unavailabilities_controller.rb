class UnavailabilitiesController < ApplicationController
  before_action :find_workspace#, only: [:show]

  def index
    @unavailabilities = @workspace.unavailabilities.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def find_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end
end
