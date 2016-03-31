class UnavailabilitiesController < ApplicationController
  def index

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

  private

  def set_unavailability
    @unavailabilty = Unavailability.find(params[:id])
  end
end
