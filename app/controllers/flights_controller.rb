class FlightsController < ApplicationController
  def index
    if params[:search]
      dep = params[:search][:departure_id]
      arr = params[:search][:arrival_id]
      dat = params[:search][:date]
      @flights = Flight.where(departure_airport_id: dep, arrival_airport_id: arr, departure_date: (dat.to_date.midnight..dat.to_date.midnight+1.day))
      unless @flights.count >0
        @flights = "empty"
      end
      render 'index'
    end
  end

  def show
    @flights = Flight.all
  end
end
# 