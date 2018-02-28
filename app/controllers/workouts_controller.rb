class WorkoutsController < ApplicationController
  def index

  end

  def create
    @workout = Workout.create(workout_params)
  end

  def new
    @workout = Workout.new
  end

  def show

  end

  def edit
 #why can't i get this to run?? <3
  end

  def workout_params
    params.require(:workout).permit(:name, :description, :notes, :date, :user_id)
  end
end
