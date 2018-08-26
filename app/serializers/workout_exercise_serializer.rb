class WorkoutExerciseSerializer < ActiveModel::Serializer
  attributes :sets, :reps, :exercise

  has_one :exercise
end
