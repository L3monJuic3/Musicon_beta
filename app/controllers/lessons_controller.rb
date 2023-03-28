class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show destroy]

  def index
    @lessons = Lesson.all
  end

  def show
    @booking = Booking.new
    @slots_available = Slot.available.where(lesson: @lesson.id)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    if @lesson.save
      redirect_to lesson_booking_path(@lesson.id, @booking.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.destroy
      redirect_to lessons_path, status: :see_other
    else
      render 'lessons/index'
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :category, :description, :price, :photo)
  end
end
