class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  # before_action :require_logged_in
  # commented out because it was causing errors when fetching

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)

    # if @exercise.save
    #   render json: @exercise, status: 201
    # else
    #   render :new
    # end
    @exercise.valid? ? (render json: @exercise, status: 201) : (render :new)

    # @exercise.save ? (redirect_to exercise_path(@exercise)) : (render :new)
    # render json: @exercise, status: 201
  end

  def index
    if !params[:muscle_group].blank?
      @exercises = Exercise.muscle_group(params[:muscle_group])
    # elsif !params[:equipment_needed].blank?
    #   @exercises = Exercise.equipment_needed(params[:equipment_needed])
    else
      @exercises = Exercise.all
    end

    respond_to do |f|
      f.html
      f.json {render json: @exercises}
    end
  end

  def show
    respond_to do |f|
      f.html
      f.json {render json: @exercise}
    end
  end

  def edit
  end

  def update
    @exercise.update(exercise_params) ? (redirect_to exercise_path(@exercise)) : (render :edit)
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path
  end

  private

    def exercise_params
    	params.require(:exercise).permit(:name, :muscle_group, :equipment, :description)
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

end
