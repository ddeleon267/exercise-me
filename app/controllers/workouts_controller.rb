class WorkoutsController < ApplicationController
  #should do a before_action here

  def index
    @workouts = current_user.workouts
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    @workout.save
    @workout.save ? (redirect_to workout_path(@workout)) : (render :new)
  end

  def show
    @workout = Workout.find(params[:id])
    @current_user = current_user
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.update(workout_params) ? (redirect_to workout_path(@workout)) : (render :edit)
  end

  def workout_params
    params.require(:workout).permit(:name, :description, :notes, :date, :user_id, exercise_ids:[])
  end

end
