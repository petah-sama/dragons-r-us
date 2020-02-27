class BookingsController < ApplicationController
  before_action :fetch_dragon, only: %i[create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.dragon = @dragon
    @booking.user = current_user

    rented = false
    bookings_for_dragon = Booking.where(dragon_id: @booking.dragon_id)

    bookings_for_dragon.each do |booking|
      starting_date = booking.start_date
      ending_date = booking.end_date
      if @booking.start_date.between?(starting_date, ending_date) || @booking.end_date.between?(starting_date, ending_date)
        rented = true
      end
    end

    if rented
      redirect_to dragon_path(@booking.dragon_id), alert: "This Dragon is already booked in the period you want to book it :("
    else
      if @booking.save
        redirect_to my_bookings_path
      else
        render 'dragons/show'
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to my_bookings_path
  end

  private

  def fetch_dragon
    @dragon = Dragon.find(params[:dragon_id])
    authorize @dragon
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end


end
