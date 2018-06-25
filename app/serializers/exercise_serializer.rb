class ExerciseSerializer < ActiveModel::Serializer
  attributes :name, :muscle_group #, :equipment, :description, :updated_at
  #can pick and choose the attributes we want to render
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
end
