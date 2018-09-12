class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :muscle_group, :description, :equipment
  has_many :workout_exercises
end
