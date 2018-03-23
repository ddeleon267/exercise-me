class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:update, :delete]
  before_action :require_logged_in
  before_action :redirect_if_unauthorized, only: [:new, :create, :edit, :update, :delete]

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
        redirect_to home_path #need some kind of alert / flash msg
      else
        @workouts = User.find(params[:user_id]).workouts
      end
    else
      @workouts = Workout.all
    end
  end

  def new
    # @workout = Workout.new
    # @workout = Workout.new(user_id: params[:user_id])
    # @exercises = @workout.exercises.build

    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to new_workout_path #need alert that user was not found
    else
      @workout = Workout.new(user_id: params[:user_id])
      @exercises = @workout.exercises.build
    end
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id

    @workout.save ? (redirect_to workout_path(@workout)) : (render :new)
  end

  def show
    @current_user = current_user
    #do i need to modify this some way bc of the nested resource???
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @workout = @user.workouts.find_by(id: params[:id]) if @user

      if @workout.nil? && @user
        redirect_to user_workouts_path(@user) #need alert
      else
        set_workout #need alert
      end
    else
      set_workout
    end
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to home_path #need alert and might choose to redirect elsewhere
      else
        @workout = user.workouts.find_by(id: params[:id])
        redirect_to user_workouts_path(user) if @workout.nil? #need alert
      end
    else
      set_workout
    end
  end

  def update
    @workout.update(workout_params) ? (redirect_to workout_path(@workout)) : (render :edit)
  end

  def delete
    @workout.destroy if @workout.user == current_user
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :description, :notes, :date, :user_id, exercise_ids:[], exercises_attributes: [:name, :muscle_group])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

end
