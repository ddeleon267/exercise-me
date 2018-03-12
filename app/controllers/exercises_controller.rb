class ExercisesController < ApplicationController
  #should refactor with a before_action
  
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
    @exercise = Exercise.find(params[:id])
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    @exercise.update(exercise_params) ? (redirect_to exercise_path(@exercise)) : (render :edit)
  end

  ## should users be able to delete exercises?? unsure

    private

    def exercise_params
  		params.require(:exercise).permit(:name, :muscle_group, :equipment, :description)
  	end
end
