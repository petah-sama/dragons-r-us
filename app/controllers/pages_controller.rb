class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_dragons
    @dragons = Dragon.where(user: current_user)
    authorize @dragons
  end
end
