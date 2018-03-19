class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  validates_presence_of :name

  def exercises_attributes=(attributes)
    # attributes.values.each do |attribute|
    #   exercise = Exercise.find_or_create_by(attribute)
    #   self.exercises << exercise
    #   self.exercises.reject { |exercise| exercise.destroy if exercise.name.blank? || exercise.muscle_group.blank? }
    # end
    attributes.each do |key, attributes|
      self.exercises.build(attributes)
      self.exercises.reject { |exercise| exercise.destroy if exercise.name.blank? || exercise.muscle_group.blank?  }
    end


  end

end
