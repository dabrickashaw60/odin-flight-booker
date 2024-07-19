class PassengerMailer < ApplicationMailer
  default from: 'no-reply@flightbooker.com'

  def booking_confirmation(passenger, booking)
    @passenger = passenger
    @booking = booking
    @flight = booking.flight
    mail(to: @passenger.email, subject: 'Booking confirmation')
  end
end
