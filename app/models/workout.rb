class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  validates_presence_of :name, :date

  accepts_nested_attributes_for :workout_exercises, :reject_if => proc { |attr| attr[:sets].blank? || attr[:reps].blank? || attr[:exercise_attributes][:name].blank? }
end
