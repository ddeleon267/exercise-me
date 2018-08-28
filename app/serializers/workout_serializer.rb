class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :updated_at, :notes, :user_name

  has_many :workout_exercises
end
