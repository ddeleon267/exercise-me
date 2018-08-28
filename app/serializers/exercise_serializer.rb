class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :muscle_group, :description, :equipment #, :description, :updated_at
  #can pick and choose the attributes we want to render
  has_many :workout_exercises
  #has_many :workouts, through: :workout_exercises ## do i need this???
end
