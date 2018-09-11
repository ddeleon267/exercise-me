class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :updated_at, :notes, :user_name, :user_id

  has_many :workout_exercises
end
