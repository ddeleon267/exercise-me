class WorkoutExercise < ApplicationRecord
  belongs_to :workout, optional: true
  belongs_to :exercise, optional: true

  validates_presence_of :sets, :reps

  def exercise_attributes=(exercise_attributes)
    #put a binding in here and play
    exercise_attributes.values.each do |attribute|
      if attribute != ""
        new_exercise = Exercise.find_or_create_by(name: attribute)
        self.exercise = new_exercise
      end
    end
  end
end

#from my previous example,, moved over from workout model
# def exercises_attributes=(attributes)
#   # attributes.values.each do |attribute|
#   #   exercise = Exercise.find_or_create_by(attribute)
#   #   self.exercises << exercise
#   #   self.exercises.reject { |exercise| exercise.destroy if exercise.name.blank? || exercise.muscle_group.blank? }
#   # end
#   attributes.each do |key, attributes|
#     self.exercises.build(attributes)
#     self.exercises.reject { |exercise| exercise.destroy if exercise.name.blank? || exercise.muscle_group.blank?  }
#   end
# end
