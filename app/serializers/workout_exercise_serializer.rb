class WorkoutExerciseSerializer < ActiveModel::Serializer
  attributes :sets, :reps

  belongs_to :exercise
end
