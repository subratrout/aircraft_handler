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

  def dequeue
    @dequeued_aircraft = Aircraft.dequeue
    if @dequeued_aircraft.class.to_s == "Aircraft"
      redirect_to root_path, notice: "The aircraft dequeued was: #{@dequeued_aircraft.aircraft_size} #{@dequeued_aircraft.aircraft_type}. There are #{Aircraft.count} aircrafts in the queue"
    else
      redirect_to root_path, notice: "No Aircraft to dequeue"
    end
  end

  private

  def aircraft_params
    params.require(:aircraft).permit(:aircraft_type, :aircraft_size)
  end


end
