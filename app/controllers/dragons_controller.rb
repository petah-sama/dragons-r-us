class DragonsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :fetch_dragon, only: %i[show edit update destroy]

  def index
    @dragons = policy_scope(Dragon).geocoded

    @markers = @dragons.map do |dragon|
      {
        lat: dragon.latitude,
        lng: dragon.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { dragon: dragon })

      }
    end
  end


  def show
    @booking = Booking.new
    @diff = case @dragon.difficulty
    when 1
      "Easy"
    when 2
      "Medium"
    when 3
      "Hard"
    end
  end

  def new
    @dragon = Dragon.new
    authorize @dragon
  end

  def create
    @dragon = Dragon.new(dragon_params)
    @dragon.user = current_user
    authorize @dragon

    if @dragon.save
      redirect_to dragons_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @dragon.update(dragon_params)
    redirect_to dragon_path(@dragon)
  end

  def destroy
    @dragon.destroy
    redirect_to dragons_path
  end

  private

  def fetch_dragon
    @dragon = Dragon.find(params[:id])
    authorize @dragon
  end

  def dragon_params
    params.require(:dragon).permit(:name, :category, :age, :price_per_day, :difficulty, :address, :photo)
  end
end
