class ExercisesController < ApplicationController
  def index

  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.save
    redirect_to exercise_path(@exercise)
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def edit

  end

    def exercise_params
  		params.require(:exercise).permit(:name, :muscle_group, :equipment, :description)
  	end
end
