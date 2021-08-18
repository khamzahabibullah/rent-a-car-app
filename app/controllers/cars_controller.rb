class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
    if params[:category].present?
      @cars = policy_scope(Car).where(category: params[:category])
    else
      @cars = policy_scope(Car)
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
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
