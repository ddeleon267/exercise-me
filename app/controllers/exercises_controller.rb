class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    # binding.pry
    @exercise.save ? (redirect_to exercise_path(@exercise)) : (render :new)
    # if @exercise.save
    # # binding.pry
    #   redirect_to exercise_path(@exercise)
    # else
    #
    # end
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def edit
    @exercise = Exercise.find(params[:id])
    ## doesn't update yet bro
  end

  ## should users be able to delete exercises?? unsure

    private

    def exercise_params
  		params.require(:exercise).permit(:name, :muscle_group, :equipment, :description)
  	end
end
