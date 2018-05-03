class Exercise < ApplicationRecord
  scope :muscle_group, -> (muscle_group) { where("muscle_group == ?", muscle_group) }

  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

  validates_presence_of :name
  validates :name, uniqueness: true
  validates :name, length: { minimum: 5 }
end
