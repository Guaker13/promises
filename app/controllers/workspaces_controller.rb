class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :delete]

  def index
  end

  def new
    @workspace = Workspace.new
  end

  def create
    workspace_params[:business_id] = current_user.business.id
    @workspace = Workspace.new(workspace_params)

    respond_to do |format|
      if @workspace.save
        format.html { redirect_to @workspace, notice: 'Workspace was successfully created.' }
        format.json { render :show, status: :created, location: @workspace }
      else
        @workspaces = workspace.all
        format.html { render :new }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
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
    @workspaces = Workspace.where(business_id: current_user.id)
  end

  private

  def set_workspace
    @workspace = Workspace.find(params[:id])
  end

  # Do not forget to update the strong params here under
  # if you want
  def workspace_params
    params.require(:workspace).permit(:business_id, :capacity,
      :wifi, :name, :location, :square_meters, :price,
      :price_unit)
  end
end