class BookingsController < ApplicationController
  before_action :fetch_dragon, only: %i[create destroy]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.dragon = @dragon
    @booking.user = current_user
    if @booking.save
      redirect_to @dragon
    else
      render 'dragons/show'
    end
  end

  def destroy
    @booking.destroy
    redirect_to my_dragons_path
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
