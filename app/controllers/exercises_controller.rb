class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in

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

  #do i want users to be able to edit exercises? Maybe
  def edit
  end

  def update
    @exercise.update(exercise_params) ? (redirect_to exercise_path(@exercise)) : (render :edit)
  end

  def destroy
    #had this issue w/ sinatra too -- > how to keep track of who added exercise? or just make it so
    #an admin can delete an exercise? idk???

    @exercise.destroy
    #if @exercise.user == current_user
    redirect_to exercises_path
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
