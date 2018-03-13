class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update]

  def index
    @workouts = current_user.workouts
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    @workout.save ? (redirect_to workout_path(@workout)) : (render :new)
  end

  def show
    @current_user = current_user
  end

  def edit
  end

  def update
    @workout.update(workout_params) ? (redirect_to workout_path(@workout)) : (render :edit)
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :description, :notes, :date, :user_id, exercise_ids:[])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

end
