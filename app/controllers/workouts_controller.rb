class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:update, :destroy]
  before_action :require_logged_in
  before_action :redirect_if_unauthorized, except: [:index, :show]

  def index
    if params[:user_id]
      set_user
      @user.nil? ? (redirect_to home_path) : (@workouts = @user.workouts)
    else
      @workouts = Workout.all.reverse
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to home_path
    else
      @workout = Workout.new(user_id: params[:user_id])
      build_exercises
    end
  end

  def create

    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end

  def show
    @current_user = current_user
    if params[:user_id]
      set_user
      set_user_workout if @user
      (@workout.nil? && @user) ? (redirect_to user_workouts_path(@user)) : (set_workout)
    else
      set_workout
    end
  end

  def edit
    if params[:user_id]
      set_user
      if @user.nil?
        redirect_to home_path
      else
        set_user_workout
        redirect_to user_workouts_path(user) if @workout.nil?
      end
    else
      set_workout
    end
  end

  def update
    @workout.workout_exercises.clear
    @workout.update(workout_params) ? (redirect_to workout_path(@workout)) : (render :edit)
  end

  def destroy
    @workout.destroy if @workout.user == current_user
    redirect_to user_workouts_path(current_user)
  end

  private

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def workout_params
      params.require(:workout).permit(:name, :description, :notes, :date, exercise_ids:[],
        workout_exercises_attributes: [:sets, :reps,
        exercise_attributes: [:name]])
    end

    def set_workout
      @workout = Workout.find(params[:id])
    end

    def set_user_workout
      @workout = @user.workouts.find_by(id: params[:id])
    end

    def build_exercises
      5.times { @workout.workout_exercises.build.build_exercise }
    end

end
