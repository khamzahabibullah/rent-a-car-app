class CarsController < ApplicationController

  def index
    @cars = Cars.all
  end

end
