class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in


  def index
     if !params[:muscle_group].blank?
       @exercises = Exercise.muscle_group(params[:muscle_group])
     else
       @exercises = Exercise.all
     end
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.save ? (redirect_to exercise_path(@exercise)) : (render :new)
  end

  def update
    @exercise.update(exercise_params) ? (redirect_to exercise_path(@exercise)) : (render :edit)
  end

  def destroy
    #had this issue w/ sinatra too -- > how to keep track of who added exercise? or just make it so
    #an admin can delete an exercise? idk???
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
