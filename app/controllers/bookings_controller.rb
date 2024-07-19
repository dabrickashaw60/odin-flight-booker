# app/controllers/bookings_controller.rb
class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_passengers = params[:num_passengers].to_i
    @booking = Booking.new(flight: @flight)
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each do |passenger|
        PassengerMailer.booking_confirmation(passenger, @booking).deliver_now
      end
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
