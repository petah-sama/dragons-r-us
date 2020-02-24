class DragonsController < ApplicationController
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
    @dragon = Dragon.new(dragon_params_create)
    if @dragon.save
      redirect_to dragon_path(@dragon)
    else
      render :new
    end
  end

  def edit; end

  def update
    @dragon.update(dragon_params_update)
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

  def dragon_params_create
    params.require(:dragon).permit(:name, :type, :age, :price_per_day, :difficulty)
  end

  def dragon_params_update
    params.require(:dragon).permit(:name, :type, :age, :difficulty)
  end
end
