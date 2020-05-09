class FlightsController < ApplicationController
  def new
    @flights = if params[:flight].present?
      Flight.where(flight_params)
    else
      Flight.all
    end.includes(:from_airport, :to_airport)
    debugger
    if params[:flight] && params[:flight][:flight_start_time].present?
      @flights = @flights.where("flight_start_time > ?", DateTime.parse(params[:flight][:flight_start_time]))
      @flights = @flights.where("flight_start_time < ?", DateTime.parse(params[:flight][:flight_start_time]) + 1.days)
    end
    if params[:flight] && params[:flight][:passengers] && @flights.any?
      @booking = Booking.new
      params[:flight][:passengers].to_i.times do 
        @booking.passengers.build 
      end
    else
      @booking = Booking.new
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:start_airport_id, :end_airport_id)
  end

  def booking_params
    params.require(:booking).permit(:flight_id)
  end
end
