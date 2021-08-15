class BookingsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car

    if @booking.save
      redirect_to @car
    else
      render 'cars/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :total_price)
  end
end
