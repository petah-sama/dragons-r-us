class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end

  def my_dragons
    @dragons = Dragon.where(user: current_user)
    authorize @dragons
    @markers = @dragons.map do |dragon|
      {
        lat: dragon.latitude,
        lng: dragon.longitude,
        infoWindow: render_to_string(partial: "dragons/info_window", locals: { dragon: dragon }),
        image_url: helpers.asset_url('dragon-avatar-blackwhite.jpg')
      }
    end

    date = Date.today
    active_bookings = []
    Booking.all.each do |booking|
      if date > booking.start_date && date < booking.end_date
        active_bookings << booking
      end
    end

    @user_dragons_bookings = []
    active_bookings.each do |booking|
      if booking.dragon.user == current_user
        @user_dragons_bookings << booking
      end
    end
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
    authorize @bookings
    date = Date.today
    @active_bookings = []
    @bookings.each do |booking|
      if date > booking.start_date && date < booking.end_date
        @active_bookings << booking
      end
    end
  end
end

