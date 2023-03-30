class BookingsController < ApplicationController
  before_action set_lesson:, only: %i[new create]

  def index
    @booking = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.lesson_id = @lesson.id
    @booking.user = current_user
    if @booking.save
      redirect_to lesson_booking_path(@lesson.id, @booking.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to bookings_path, status: :see_other
    else
      render 'bookings/index'
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[lesson_id])
  end

  def booking_params
    params.require(:booking).permit(:booking_date, :is_cancelled, :slot_id)
  end
end
