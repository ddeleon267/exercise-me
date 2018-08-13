class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :updated_at

  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  #has_many :exercises, serializer: WorkoutExerciseSerializer

end
