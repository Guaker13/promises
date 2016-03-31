class BookingsController < ApplicationController
  before_action :find_workspace, only: [:new, :show, :create]
  before_action :set_booking, only: [:show]
  before_action :set_worker, only: [:create, :list_business, :list_worker]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.worker = @worker
    @booking.workspace = @workspace

    if availability_check(@booking.start_time, @booking.end_time)
      respond_to do |format|
        if @booking.save
          @unavailabilty = Unavailability.new(booking_params)
          @unavailabilty.workspace = @workspace
          @unavailabilty.save
          format.html { redirect_to workspace_path(@workspace), notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @unavailability }
        else
          format.html { redirect_to workspace_path(@workspace) }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { redirect_to workspace_path(@workspace) }
      format.json { render json: @booking.errors, status: :unprocessable_entity }
    end
  end

  def show
  end

  def list_business
  end

  def list_worker
  end

  private

  def find_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def set_booking
    @booking = @workspace.Booking.find(params[:id])
  end

  def set_worker
    @worker = current_user.worker
  end

  def booking_params
    params.require(:booking).permit(:workspace_id, :worker_id, :start_time, :end_time)
  end

  def availability_check(start_time, end_time)
    @workspace.unavailabilities.each do |unavailability|
      unavailability_range = (unavailability.start_time..unavailability.end_time)
      if unavailability_range.cover?(start_time..end_time)
        return false
      end
    end
    return true
  end
end


  # if unavailability.start_time <= start_time && start_time <= unavailability.end_time
  #   return false
  # elsif unavailability.start_time <= end_time && end_time <= unavailability.end_time
  #   return false
  # elsif start_time <= unavailability.start_time && navailability.start_time <= end_time
  #   return false
  # elsif unavailability.start_time <= end_time && end_time <= unavailability.end_time
  #   return false
  # else
  # end
