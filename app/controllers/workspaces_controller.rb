class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :delete]

  def index
  end

  def new
    @workspace = Workspace.new
    @workspace.pictures.build
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.business_id = current_user.business.id
    respond_to do |format|
      if @workspace.save
        format.html { redirect_to workspaces_dashboard_path, notice: 'Workspace was successfully created.' }
        format.json { render :show, status: :created, location: @workspace }
      else
        @workspaces = workspace.all
        format.html { render :new }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @latitude = @workspace.latitude
    @longitude = @workspace.longitude
    @booking = Booking.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @workspace.update(workspace_params)
        format.html { redirect_to workspaces_dashboard_path, notice: 'Workspace was successfully updated.' }
        format.json { render :show, status: :ok, location: @workspace }
      else
        format.html { render :edit }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  def search
    @workspaces = Workspace.near(params[:city])
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
      :price_unit,
      pictures_attributes: [:photo, :photo_cache])
  end
end
