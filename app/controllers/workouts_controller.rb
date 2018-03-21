class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update]

  def index
    # @workouts = Workout.all
    # @workouts = Workout.where("user_id = ?", current_user.id)
    # @workouts = current_user.workouts
    #do i need to modify this some way bc of the nested resource???
    #so this works if i
    # binding.pry
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to home_path, alert: "Artist not found"
      else
        @workouts = User.find(params[:user_id]).workouts
      end
    else
      @workouts = Workout.all
    end
  end

  def new
    @workout = Workout.new
    @exercises = @workout.exercises.build
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id

    @workout.save ? (redirect_to workout_path(@workout)) : (render :new)
  end

  def show
    @current_user = current_user
    #do i need to modify this some way bc of the nested resource???
  end

  def edit
  end

  def update
    @workout.update(workout_params) ? (redirect_to workout_path(@workout)) : (render :edit)
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :description, :notes, :date, :user_id, exercise_ids:[], exercises_attributes: [:name, :muscle_group])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

end
