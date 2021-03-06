class BookingsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    @car.bookings
    authorize @booking

    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy

    redirect_to my_bookings_path
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
    authorize @bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :car_id, :bookings_count)
  end
end
