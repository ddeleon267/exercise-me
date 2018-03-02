class WorkoutsController < ApplicationController
  def index

  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    @workout.save
    @workout.save ? (redirect_to workout_path(@workout)) : (render :new)
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
    params.require(:workout).permit(:name, :description, :notes, :date, :user_id, exercise_ids:[])
  end
end
