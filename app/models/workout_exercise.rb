class WorkoutExercise < ApplicationRecord
  belongs_to :workout, optional: true
  belongs_to :exercise, optional: true

  validates_presence_of :sets, :reps
  validates :sets, :reps, numericality: { only_integer: true }

  def exercise_attributes=(exercise_attributes)
    exercise_attributes.values.each do |attribute|
      if attribute != ""
        new_exercise = Exercise.find_or_create_by(name: attribute)
        self.exercise = new_exercise
      end
    end
  end
end
