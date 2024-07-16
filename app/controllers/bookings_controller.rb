class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_passengers = params[:num_passengers]
  end
end
