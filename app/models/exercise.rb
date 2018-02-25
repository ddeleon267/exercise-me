class Exercise < ApplicationRecord
  #what attributes to i want to have? need to add validations as appropriate
  validates_presence_of :name, :muscle_group, :email
  validates :name, uniqueness: true


  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises
end
