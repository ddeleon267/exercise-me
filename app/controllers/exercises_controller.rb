class ExercisesController < ApplicationController

  def index

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

  # def create
  #   @character = Character.create(character_params)
  #   @character.valid? ? (redirect_to user_show_characters_path) : (render :new)
  # end 

  def show
    @exercise = Exercise.find(params[:id])
  end

  def edit

  end

    private

    def exercise_params
  		params.require(:exercise).permit(:name, :muscle_group, :equipment, :description)
  	end
end
