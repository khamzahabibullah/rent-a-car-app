class CarsController < ApplicationController
skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
    @cars = policy_scope(Car)

    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window: render_to_string(partial: "info_window", locals: { car: car }),
        image_url: helpers.asset_url('car.png')
      }
    end
  end

  def show
    @car = Car.find(params[:id])
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user

    authorize @car
    if @car.save
      redirect_to @car
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
    authorize @car
  end

  def update
    @car = Car.find(params[:id])
    authorize @car
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    authorize @car
    @car.destroy

    redirect_to @car
  end

  private

  def car_params
    params.require(:car).permit(:name, :model, :address, :year, :category, :price, :photo)
  end

end
