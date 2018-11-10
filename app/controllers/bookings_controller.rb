class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:booking][:flight_id])
    @pass_nbr = params[:booking][:pass_nbr].to_i
  end

  def create
    @flight_id = params[:booking][:flight_id].to_i

    @booking = Booking.create(flight_id: @flight_id)
    @pass_nbr = params[:booking][:pass_nbr].to_i

    params[:passenger].each do |key, pass_name|
      new_pass = Passenger.create(name: pass_name)
      @booking.passengers << new_pass
    end
    flash[:success] = "Votre réservation a été effectuée avec succès! 🚀"
    redirect_to booking_path(@booking.id)
  end

  def show
    puts flash
    puts "$"*40
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end
end
