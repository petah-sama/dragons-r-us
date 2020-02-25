class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @dragon = Dragon.find(params[:dragon_id])
    @booking = Booking.new(booking_params)
    @booking.dragon = @dragon
    @booking.user = current_user
    if @booking.save
      redirect_to @dragon
    else
      render 'dragons/show'
    end
  end

#associar os resultados de data, booking_params.

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
