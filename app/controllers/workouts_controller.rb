class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:update, :destroy]
  before_action :require_logged_in
  before_action :redirect_if_unauthorized, except: [:index, :show]

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      # if @user.nil?
      #   redirect_to home_path
      # else
      #   @workouts = User.find(params[:user_id]).workouts
      # end
      @user.nil? ? (redirect_to home_path) : (@workouts = User.find(params[:user_id]).workouts)
    else
      @workouts = Workout.all
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to new_workout_path
    else
      @workout = Workout.new(user_id: params[:user_id])
      # @exercises = @workout.exercises.build
      5.times { @workout.workout_exercises.build.build_exercise }
    end
  end

  def create
    # @workout = Workout.new(workout_params)
    # @workout.user_id = current_user.id
    #
    # @workout.save ? (redirect_to workout_path(@workout)) : (render :new)
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      redirect_to workout_path(@workout)
    else
      5.times { @workout.workout_exercises.build.build_exercise }
      render 'new'
    end
  end

  def show
    @current_user = current_user
    #do i need to modify this some way bc of the nested resource???
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @workout = @user.workouts.find_by(id: params[:id]) if @user
      (@workout.nil? && @user) ? (redirect_to user_workouts_path(@user)) : (set_workout)

      # if @workout.nil? && @user
      #   redirect_to user_workouts_path(@user) #need alert
      # else
      #   set_workout #need alert
      # end
    else
      set_workout
    end
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to home_path
      else
        @workout = user.workouts.find_by(id: params[:id])
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

  def workout_params
    params.require(:workout).permit(:name, :description, :notes, :date, :user_id, exercise_ids:[], workout_exercises_attributes: [:sets, :reps, exercise_attributes: [:name]])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

end
