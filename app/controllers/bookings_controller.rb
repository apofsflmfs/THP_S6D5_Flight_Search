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

    @pass_nbr.times do |n|
      pass_name = params[:passenger]["name_#{n+1}".to_sym]
      pass = Passenger.create(name: params[:passenger]["name_#{n+1}".to_sym])
      @booking.passengers << pass
    end
    flash[:success] = "Votre réservation a été effectuée avec succès!"
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
