class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :fetch_dragon, only: %i[show edit update destroy]

  def index
    @dragons = Dragon.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @dragon = Dragon.new
  end

  def create
    @dragon = Dragon.new(dragon_params)
    @dragon.user = current_user
    if @dragon.save
      redirect_to dragons_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @dragon.update(dragon_params)
    redirect_to dragon_path
  end

  def destroy
    @dragon.destroy
    redirect_to dragons_path
  end

  private

  def fetch_dragon
    @dragon = Dragon.find(params[:id])
  end

  def dragon_params
    params.require(:dragon).permit(:name, :category, :age, :price_per_day, :difficulty, :photo)
  end
end
