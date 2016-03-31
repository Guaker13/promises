class UnavailabilitiesController < ApplicationController
  before_action :find_workspace

  def index
    @unavailabilities = @workspace.unavailabilities.all
    @unavailability = @workspace.unavailabilities.build
  end

  def show
  end

  def new
  end

  def create
    @unavailabilty = Unavailability.new(unavailability_params)
    @unavailabilty.workspace = @workspace

    respond_to do |format|
      if @unavailabilty.save
        format.html { redirect_to workspace_unavailabilities_path(@workspace), notice: 'Unavailability was successfully created.' }
        format.json { render :show, status: :created, location: @unavailability }
      else
        @unavailabilities = Unavailability.all
        format.html { render :index }
        format.json { render json: @unavailability.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def set_unavailability
    @unavailabilty = @workspace.Unavailability.find(params[:id])
  end

  def find_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def unavailability_params
    params.require(:unavailability).permit(:workspace_id, :start_time, :end_time)
  end
end
