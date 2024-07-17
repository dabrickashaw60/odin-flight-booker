class FlightsController < ApplicationController
  def index
    @airports = Airport.all  # For dropdowns in the search form

    # Initialize @available_dates to avoid nil errors
    @available_dates = Flight.distinct.pluck(:start_datetime).map(&:to_date).uniq

    # # Filter flights based on query parameters
    # if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:flight_date].present?
    #   start_date = params[:flight_date].to_date.beginning_of_day
    #   @flights = Flight.where(
    #     departure_airport_id: params[:departure_airport_id],
    #     arrival_airport_id: params[:arrival_airport_id],
    #     start_datetime: start_date..start_date.end_of_day
    #   )
    # else
    #   @flights = Flight.none
    # end

    @flights = Flight.all

    if params[:departure_airport_id].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
    end

    if params[:arrival_airport_id].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
    end

    if params[:flight_date].present?
      flight_date = Date.parse(params[:flight_date])
      @flights = @flights.where(start_datetime: flight_date.beginning_of_day..flight_date.end_of_day)
    end

    if params[:num_passengers].present?
      @num_passengers = params[:num_passengers].to_i
    end

  end
  def all_flights
    @flights = Flight.all
  end
end
