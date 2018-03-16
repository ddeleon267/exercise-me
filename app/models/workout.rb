class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  validates_presence_of :name

  def exercises_attributes=(attributes)
    attributes.values.each do |attribute|
      exercise = Exercise.find_or_create_by(attribute)
      self.exercises << exercise
    end
  end
end
