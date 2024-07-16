class FlightsController < ApplicationController
  def index
    @airports = Airport.all  # For dropdowns in the search form

    # Initialize @available_dates to avoid nil errors
    @available_dates = Flight.distinct.pluck(:start_datetime).map(&:to_date).uniq

    # Filter flights based on query parameters
    if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:flight_date].present?
      start_date = params[:flight_date].to_date.beginning_of_day
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id],
        start_datetime: start_date..start_date.end_of_day
      )
    else
      @flights = Flight.none
    end
  end
end
