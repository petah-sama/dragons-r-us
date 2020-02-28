class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end

  def my_dragons

    if params[:query].present?
      @dragons = Dragon.where(user:current_user).search_by_name_and_category(params[:query])
      authorize @dragons
    else
      @dragons = Dragon.where(user:current_user)
      authorize @dragons
    end
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
    authorize @bookings
  end
end

