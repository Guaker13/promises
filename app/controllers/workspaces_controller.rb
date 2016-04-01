class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show, :edit, :update, :delete]

  def index
  end

  def new
    @workspace = Workspace.new
    @workspace.pictures.build
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @workspace = Workspace.new(workspace_params)
    @workspace.business_id = current_user.business.id
    respond_to do |format|
      if @workspace.save
        format.html { redirect_to workspaces_dashboard_path, notice: 'Workspace was successfully created.' }
        format.js
      else
        @workspaces = workspace.all
        format.html { render :new }
        format.js
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


  def search
    @show = []
    @work = []
    @workspaces = Workspace.near(params[:city])
    p @workspaces
    p "****************************************"
    @s = (params[:start_time])
    @e = (params[:end_time])
    @workspaces.each do |workspace|
      workspace.unavailabilities.each do |unavailability|

       if unavailability.start_time <= @s && @s <= unavailability.end_time
        @show << false
      elsif unavailability.start_time <= @e && @e <= unavailability.end_time
       @show << false
     elsif @s <= unavailability.start_time && unavailability.start_time <= @e
       @show << false
     else
       @show <<  true
     end
   end
     @show.include?(false) ? @work << false : @work << true
     @show = []
 end
 p "****************************************"
 p @work
 p "****************************************"
 h = Hash[@workspaces.zip @work]
 p h
 h.each { |k,v| @show << k if v == true }
 @show
 redirect_to "/", alert: 'No worskpaces available at this given time period int the given area!' if @show.empty?
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
