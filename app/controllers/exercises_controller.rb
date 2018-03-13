class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update]

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.save ? (redirect_to exercise_path(@exercise)) : (render :new)
  end

  def show
  end

  def edit
  end

  def update
    @exercise.update(exercise_params) ? (redirect_to exercise_path(@exercise)) : (render :edit)
  end

  ## should users be able to delete exercises?? unsure

  private

  def exercise_params
  	params.require(:exercise).permit(:name, :muscle_group, :equipment, :description)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end
