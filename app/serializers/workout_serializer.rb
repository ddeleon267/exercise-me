class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :updated_at

  has_many :workout_exercises
end
