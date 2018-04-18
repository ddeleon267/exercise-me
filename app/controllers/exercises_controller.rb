class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in

  def new
    @exercise = Exercise.new
  end

  def create 
    @exercise = Exercise.new(exercise_params)
    @exercise.save ? (redirect_to exercise_path(@exercise)) : (render :new)
  end

  def index
    #maybe express this condition more eloquently
     if !params[:muscle_group].blank?
       @exercises = Exercise.muscle_group(params[:muscle_group])
       ##look at the sql here?
     else
       @exercises = Exercise.all
     end
  end

  def show
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
      #is the equipment attribute currently in the form? could also try implementing a view
      #for exerises that don't require equipment? could maybe change to a boolean vs. string.
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end
end
