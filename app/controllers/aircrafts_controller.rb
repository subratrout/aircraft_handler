class AircraftsController < ApplicationController

  def index
    @aircrafts = Aircraft.all
  end

  def new
    @aircraft = Aircraft.new
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)
    if @aircraft.save
      redirect_to root_path, notice: "Aircraft  was added to the queue."
    else
      render :new
    end
  end

  private

  def aircraft_params
    params.require(:aircraft).permit(:aircraft_type, :aircraft_size)
  end


end
