class Exercise < ApplicationRecord
  scope :muscle_group, -> (muscle_group) { where("muscle_group == ?", muscle_group) }
  # scope :equipment_needed, -> (equipment_needed) { where("equipment == ?", equipment_needed)}


  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 5 }
end
