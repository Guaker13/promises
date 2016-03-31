class BookingsController < ApplicationController
  before_action :find_workspace, only: [:new, :show, :create]
  before_action :set_booking, only: [:show]
  before_action :set_worker, only: [:create, :list_business, :list_worker]

  def new
  end

  def create
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
    @worker = current_user
  end

  def booking_params
    params.require(:booking).permit(:workspace_id, :worker_id, :start_time, :end_time)
  end
end
